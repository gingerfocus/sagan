int collatz_conjecture(int i) {
  printf("%d ", i);

  if (i <= 0) {
    fprintf(stderr, "\n\nColatz conjecure doesn't converge for x <= 0.\n");
    std::abort();
  } else if (i == 1) {
    printf("\n");
    return 0;
  } else if (i % 2 == 0) {
    return collatz_conjecture(i / 2);
  } else {
    return collatz_conjecture(3 * i + 1);
  }
}
