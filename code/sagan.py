#!/usr/bin/env python3

import json
import os
import random
import shutil
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
WORK = REPO / "work"
CONSOLIDATED_DIR = WORK / ".consolidated"
STATE_DIR = Path(os.environ.get("XDG_DATA_HOME", Path.home() / ".local" / "share")) / "sagan"
STATE_FILE = STATE_DIR / "state.json"

ROOTS = [WORK]
ROOT_NAMES = {"work"}

MEDIA_EXTS = {
    ".pdf", ".jpg", ".jpeg", ".JPG", ".JPEG",
    ".png", ".gif", ".svg", ".excalidraw",
    ".mp4", ".mov", ".MOV", ".m4a", ".mp3",
    ".docx", ".pptx", ".odt", ".rtf", ".xlsx",
}

SKIP_EXTS = {
    ".o", ".obj", ".elf", ".bin", ".hex", ".map", ".lst",
    ".a", ".lib", ".so", ".dll", ".exe",
    ".zip", ".tar", ".gz", ".bz2", ".xz", ".7z",
    ".class", ".pyc", ".dex",
    ".lock", ".user", ".csv", ".json",
    ".html", ".css", ".js",
}

SKIP_DIRS = {".consolidated", ".direnv", ".git", ".zig-cache", "__pycache__", "node_modules", "build", "doc"}

def sidecar_path(fpath):
    return Path(str(fpath) + ".sagan.md")

def is_media(fpath):
    return fpath.suffix in MEDIA_EXTS

def load_state():
    if STATE_FILE.exists():
        with open(STATE_FILE) as f:
            return json.load(f)
    return {"files": {}, "last_opened": None}

def save_state(state):
    STATE_DIR.mkdir(parents=True, exist_ok=True)
    with open(STATE_FILE, "w") as f:
        json.dump(state, f, indent=2)

def scan_files():
    files = []
    for root in ROOTS:
        for dirpath, dirs, filenames in os.walk(root):
            dirs[:] = [d for d in dirs if d not in SKIP_DIRS]
            for name in filenames:
                if name == "README.md" or name == "README.TXT":
                    continue
                if name.endswith(".sagan.md"):
                    continue
                fpath = Path(dirpath) / name
                if fpath.suffix in SKIP_EXTS:
                    continue
                rel = fpath.relative_to(REPO)
                files.append(str(rel))
    return sorted(files)

def active_files(state):
    return [f for f in scan_files() if not state["files"].get(f, {}).get("consolidated")]

def pick_file(state):
    files = active_files(state)
    if not files:
        print("No active files. All consolidated!")
        return None
    weights = []
    now = datetime.now(timezone.utc)
    for f in files:
        rec = state["files"].get(f)
        if not rec or not rec.get("last_reviewed"):
            weights.append(10)
        else:
            last = datetime.fromisoformat(rec["last_reviewed"])
            days = (now - last).days
            weights.append(1 + days * 0.5)
    return random.choices(files, weights=weights, k=1)[0]

def consolidated_dest(rel_path):
    parts = Path(rel_path).parts
    if parts[0] in ROOT_NAMES and len(parts) > 1:
        sub = Path(*parts[1:])
    else:
        sub = Path(rel_path)
    return CONSOLIDATED_DIR / sub

def cmd_open(state):
    f = pick_file(state)
    if not f:
        return
    fpath = REPO / f
    if not fpath.exists():
        print(f"File not found: {f}")
        return
    media = is_media(fpath)
    sc = sidecar_path(fpath) if media else None
    if media:
        if not sc.exists():
            sc.write_text("")
        print(f"Opening: {f} (media + annotation)")
        viewer = subprocess.Popen(["open", str(fpath)])
        subprocess.run(["open", str(sc)])
        viewer.terminate()
        try:
            viewer.wait(timeout=2)
        except subprocess.TimeoutExpired:
            viewer.kill()
    else:
        print(f"Opening: {f}")
        subprocess.run(["open", str(fpath)])
    rec = state["files"].setdefault(f, {})
    rec.setdefault("first_seen", datetime.now(timezone.utc).isoformat())
    rec["last_reviewed"] = datetime.now(timezone.utc).isoformat()
    rec["review_count"] = rec.get("review_count", 0) + 1
    state["last_opened"] = f
    save_state(state)
    ans = input("Consolidated? y/N ").strip().lower()
    if ans == "y":
        cmd_done(state)

def cmd_done(state):
    f = state.get("last_opened")
    if not f:
        print("No file was last opened.")
        return
    fpath = REPO / f
    if not fpath.exists():
        print(f"File not found: {f}")
        return
    dest = consolidated_dest(f)
    dest.parent.mkdir(parents=True, exist_ok=True)
    shutil.move(str(fpath), str(dest))
    rec = state["files"].setdefault(f, {})
    rec["consolidated"] = True
    rec["consolidated_at"] = datetime.now(timezone.utc).isoformat()
    state["last_opened"] = None
    state.pop("last_opened_sidecar", None)
    save_state(state)
    print(f"Consolidated: {f}")

def cmd_skip(state):
    f = state.get("last_opened")
    if f:
        print(f"Skipped: {f}")
    cmd_open(state)

def cmd_stats(state):
    all_files = scan_files()
    consolidated = sum(1 for f in all_files if state["files"].get(f, {}).get("consolidated"))
    active = len(all_files) - consolidated
    courses = {}
    for f in all_files:
        parts = Path(f).parts
        if len(parts) >= 3:
            course = parts[1]
        elif len(parts) == 2:
            course = parts[1]
        else:
            course = "unknown"
        courses.setdefault(course, {"active": 0, "consolidated": 0})
        if state["files"].get(f, {}).get("consolidated"):
            courses[course]["consolidated"] += 1
        else:
            courses[course]["active"] += 1
    print(f"Total files: {len(all_files)}")
    print(f"Active: {active}  Consolidated: {consolidated}")
    print()
    for course in sorted(courses):
        c = courses[course]
        print(f"  {course}: {c['active']} active, {c['consolidated']} consolidated")

def cmd_list(state):
    files = active_files(state)
    if not files:
        print("No active files.")
        return
    for f in files:
        rec = state["files"].get(f, {})
        count = rec.get("review_count", 0)
        last = rec.get("last_reviewed", "never")
        if last != "never":
            last = last[:10]
        fpath = REPO / f
        tag = " [media]" if is_media(fpath) else ""
        print(f"  {f}{tag}  (reviews: {count}, last: {last})")

def cmd_reset(state, target):
    found = None
    for f in state["files"]:
        if f == target or Path(f).name == target:
            found = f
            break
    if not found:
        print(f"File not in state: {target}")
        return
    rec = state["files"][found]
    if not rec.get("consolidated"):
        print(f"File not consolidated: {found}")
        return
    dest = consolidated_dest(found)
    src = REPO / found
    src.parent.mkdir(parents=True, exist_ok=True)
    if dest.exists():
        shutil.move(str(dest), str(src))
        print(f"Moved back: {found}")
    else:
        print(f"Consolidated file not found at {dest}, marking as active anyway.")
    rec["consolidated"] = False
    rec.pop("consolidated_at", None)
    save_state(state)

def cmd_help():
    print("""usage: sagan [command]

commands:
  (none)    Pick a random active file, open via `open`
  done      Mark last-opened file as consolidated
  skip      Skip current file, pick another
  stats     Show file statistics
  list      List all active files
  reset F   Un-consolidate a file
  help      Show this help""")

def main():
    state = load_state()
    if len(sys.argv) < 2:
        cmd_open(state)
    else:
        cmd = sys.argv[1]
        if cmd == "done":
            cmd_done(state)
        elif cmd == "skip":
            cmd_skip(state)
        elif cmd == "stats":
            cmd_stats(state)
        elif cmd == "list":
            cmd_list(state)
        elif cmd == "reset":
            if len(sys.argv) < 3:
                print("usage: sagan reset <file>")
                sys.exit(1)
            cmd_reset(state, sys.argv[2])
        elif cmd in ("help", "--help", "-h"):
            cmd_help()
        else:
            print(f"Unknown command: {cmd}")
            cmd_help()
            sys.exit(1)

if __name__ == "__main__":
    main()
