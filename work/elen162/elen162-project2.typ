#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ELEN162 - Project 2", columns: 1, author: "Evan Stokdyk")

#import "@preview/diagraph:0.3.6"

#set math.mat(delim: ("[", "]"))

#let zero = []
#let nonz = "*"
#let x = "*";

= Problem 1

Given the adjacency matrix it is possible to contruct the following matrix that
repersents its connections.

#let adjacency-matrix(n, edges, zero: [], directed: false) = {
    let matrix = range(n).map(i => range(n).map(j => zero))

    for (u, v) in edges {
        matrix.at(u - 1).at(v - 1) = [.1]

        if not directed {
            matrix.at(v - 1).at(u - 1) = [.1]
        }
    }

    // set diagonal connections
    for i in range(n) {
        matrix.at(i).at(i) = [10]
    }

    // TODO, build a way to copy this to text ..matrix
    math.mat(
        align: right,
        ..matrix

    )
}

#let links = (
    (1, 2),   (1, 39),  (2, 3),   (2, 25),  (2, 30),  (3, 18),  (4, 14),
    (4, 18),  (5, 6),   (5, 8),   (6, 7),   (6, 31),  (6, 11),  (7, 8),   (8, 9),   (9, 39),
    (10, 11), (10, 13), (10, 32), (11, 12), (12, 13), (13, 14), (14, 15), (15, 16),
    (16, 17), (16, 19), (16, 21), (16, 24), (17, 18), (17, 27), (19, 20),
    (19, 33), (20, 34), (21, 22), (22, 23), (22, 35), (23, 24), (23, 36), (25, 37),
    (25, 26), (26, 27), (26, 28), (26, 29), (28, 29), (29, 38)
);

#align(center)[#scale(90%)[#adjacency-matrix(39, links)]]

I will use matlab for this factorization and can then count the non zero
elements to find that there are 226 instances of fill in.

This is the spy plot of the LU factorization:

#align(center)[
$mat(
nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz;
nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, nonz;
zero, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, nonz;
zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, nonz, nonz, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, nonz, nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, zero, nonz, zero, zero, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, zero, zero, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, zero, zero, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, nonz, zero, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, nonz, zero, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, nonz, nonz, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, nonz, nonz, zero, zero, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, nonz, zero, zero, nonz, zero, zero, nonz, nonz, nonz, zero, zero, zero, nonz;
zero, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, zero, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
zero, nonz, nonz, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
nonz, nonz, nonz, zero, zero, zero, zero, zero, nonz, zero, zero, zero, zero, zero, zero, zero, zero, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, nonz, zero, zero, nonz, nonz, nonz, zero, nonz, nonz, nonz;
)$
]

Based on this visual it is likly that the matrix will respond will to BBD
parellization.

#h(1fr) $ballot$

= Problem 2

#let make-adjacency(n, links) = {
    let connections = range(n).map(i => range(n).map(j => none))

    for (r, c) in links {
        connections.at(r - 1).at(c - 1) = []
    }

    connections
};

To create an minimal degree ordering we must first remove nodes that have only
one neighbor.

$
    p_1 = [30, 31, 32, 33, 34, 20, 19, 35, 36, 37, 38]
$

#let links1 = (
    (1, 2),   (1, 39), (2, 3),   (2, 25),  (3, 18),  (4, 14),
    (4, 18),  (5, 6),   (5, 8),   (6, 7),   (6, 11),  (7, 8),   (8, 9), (9, 39),
    (10, 11), (10, 13), (11, 12), (12, 13), (13, 14), (14, 15), (15, 16),
    (16, 17), (16, 21), (16, 24), (17, 18), (17, 27),
    (21, 22), (22, 23), (23, 24),
    (25, 26), (26, 27), (26, 28), (26, 29), (28, 29),
);

// #set diagraph.adjacency(
//     rankdir: "LR",
//     directed: false
// )

#align(center)[#scale(50%, reflow: true)[
    #diagraph.adjacency(
        vertex-labels: range(39).map(i => [#scale(200%)[#(i+1)]]),
        make-adjacency(39, links1),
        layout: "neato",
        rankdir: "LR",
        edge: (arrowsize: 0.3),
        node: (
            shape: "circle",
            width: 0.48,
            fixedsize: true,
        ),
        directed: false
    )
]]

From here, all nodes have at least and adjacency of 2 so removing will often
cause fill in as such we can try to find small loops to remove so that they do
cause more fill in later.
$
    p_2 = [28, 29, 5, 7, 10, 12, 21, 22, 23, 24]
$

#let links2 = (
    (1, 2),   (1, 39), (2, 3),   (2, 25),  (3, 18),  (4, 14),
    (4, 18),  (6, 8),  (6, 11),  (8, 9), (9, 39),
    (11, 13), (13, 14), (14, 15), (15, 16),
    (16, 17), (17, 18), (17, 27),
    (25, 26), (26, 27),
);

#align(center)[#scale(50%, reflow: true)[
    #diagraph.adjacency(
        vertex-labels: range(39).map(i => [#scale(200%)[#(i+1)]]),
        make-adjacency(39, links2),
        layout: "neato",
        rankdir: "LR",
        edge: (arrowsize: 0.3),
        node: (
            shape: "circle",
            width: 0.48,
            fixedsize: true,
        ),
        directed: false
    )
]]

Now we can, close the three loops:

$
    p_3 = [1, 3, 4, 6, 8, 9, 11, 13, 15, 16, 25, 26, 27, 39]
$

#let links2 = (
    (2, 18),   (2, 14), (2, 17), 
    (14, 17), (14, 18), (17, 18),
);

#align(center)[#scale(50%, reflow: true)[
    #diagraph.adjacency(
        vertex-labels: range(39).map(i => [#scale(200%)[#(i+1)]]),
        make-adjacency(39, links2),
        layout: "neato",
        rankdir: "LR",
        edge: (arrowsize: 0.3),
        node: (
            shape: "circle",
            width: 0.48,
            fixedsize: true,
        ),
        directed: false
    )
]]

This is now a densly connected network and there can be no further imporvement.
$
    p_4 = [2, 14, 17, 18]
$

This gives the final permutation vector of:
$
    p = [30, 31, 32, 33, 34, 20, 19, 35, 36, 37, \
        38, 28, 29, 5, 7, 10, 12, 21, 22, 23, \
        24, 1, 3, 4, 6, 8, 9, 11, 13, 15, 16, \
        25, 26, 27, 39, 2, 14, 17, 18]

$

Now we can use this to permute the matrix.

#align(center)[#scale(80%)[$mat(
10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero;
zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, 10, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, 10, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, .1, 10, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, .1, zero, .1, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, .1;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, .1;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, .1, zero, zero, zero, zero, zero, .1, zero, zero;
zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10, zero, zero, zero, zero, zero, zero, .1, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, 10, .1, zero, zero, .1, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10, .1, zero, zero, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10, zero, zero, zero, .1, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, .1, zero, zero, zero, zero, zero, zero, zero, 10, zero, zero, zero, zero;
.1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, 10, zero, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, 10, zero, zero;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, zero, zero, .1, zero, zero, zero, 10, .1;
zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, .1, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, zero, .1, 10;
)$]]

Now by using a calculator it is possible to show that there is:
67 instances of fill in.

When using the matlab symamd method to find fill in there is now 71 instances of
fill in. This is to be exepected as the "a" in symamd stands for aproximate
which means although it does not find the best solution it still finds a very
good one. It likly makes this trade so that the algorithm can find a permutation
much faster.

#h(1fr) $ballot$

= Problem 3

#let matrix = (
    (x, 0, 0, x, 0, x, 0, x, 0, 0, 0, 0, 0, 0, 0),
    (0, x, 0, 0, 0, 0, x, 0, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, x, 0, 0, 0, 0, 0, x, 0, 0, 0, 0, 0, 0),
    (x, 0, 0, x, x, 0, 0, x, 0, 0, 0, x, 0, 0, 0),
    (0, 0, 0, x, x, 0, 0, x, 0, 0, 0, x, 0, 0, 0),
    (x, 0, 0, 0, 0, x, 0, 0, 0, x, 0, 0, 0, 0, 0),
    (0, x, 0, 0, 0, 0, x, 0, 0, 0, x, 0, 0, 0, x),
    (x, 0, 0, x, x, 0, 0, x, 0, 0, x, 0, x, x, x),
    (0, 0, x, 0, 0, 0, 0, 0, x, 0, x, 0, 0, x, 0),
    (0, 0, 0, 0, 0, x, 0, 0, 0, x, 0, 0, x, 0, 0),
    (0, 0, 0, 0, 0, 0, x, x, x, 0, x, 0, 0, 0, x),
    (0, 0, 0, x, x, 0, 0, 0, 0, 0, 0, x, 0, 0, 0),
    (0, 0, 0, 0, 0, 0, 0, x, 0, x, 0, 0, x, 0, 0),
    (0, 0, 0, 0, 0, 0, 0, x, x, 0, 0, 0, 0, x, 0),
    (0, 0, 0, 0, 0, 0, x, x, 0, 0, x, 0, 0, 0, x),
);

#align(center)[#scale(150%, reflow: true)[#math.mat(..matrix)]]

This matrix is symetric which means that it is possible to construct a graph from it:

#align(center)[
    #diagraph.adjacency(
        vertex-labels: ("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"),
        matrix.enumerate().map(enum => {
            let (i, row) = enum;
            row.enumerate().map(enum => {
                let (j, val) = enum;
                if val == 0 or j >= i {none} else {[]}
            }
        )}),
        layout: "neato",
        rankdir: "LR",
        edge: (
            arrowsize: 0.3,
        ),
        node: (
            shape: "circle",
            width: 0.3,
            fixedsize: true,
        ),
        directed: false
    )
]


#let lapadjacency = (3, 1, 1, 4, 3, 2, 3, 6, 3, 2, 4, 2, 2, 2, 3);
#let lapmatrix = matrix.enumerate().map(enum => {
    let (i, row) = enum;
    row.enumerate().map(enum => {
        let (j, val) = enum;

        if (i == j) {lapadjacency.at(i)}
        else if val == 0 {0}
        else {-1}
    }
)});

From this graph we can create a laplacian matrix of it as follows:
$
    Q = mat(..lapmatrix)
$

By finding the smalles eigenvalue of this matrices coresponding eigenvector I am
able to find the median of those values (however in this case all the values in
the eigenvector are the same). The sperator value was found with code seen at the end:
$
    "sep" &= 0.258199 \
    p &= [2,3,4,5,6,7,8,9,10,11,12,13,14,15,1]
$

This is not a good permutation and has little effect on the matrix
$
    mat(
        #x, 0, 0, #x, 0, #x, 0, #x, 0, 0, 0, 0, 0, 0, 0;
        0, #x, 0, 0, 0, 0, #x, 0, 0, 0, 0, 0, 0, 0, 0;
        0, 0, #x, 0, 0, 0, 0, 0, #x, 0, 0, 0, 0, 0, 0;
        #x, 0, 0, #x, #x, 0, 0, #x, 0, 0, 0, #x, 0, 0, 0;
        0, 0, 0, #x, #x, 0, 0, #x, 0, 0, 0, #x, 0, 0, 0;
        #x, 0, 0, 0, 0, #x, 0, 0, 0, #x, 0, 0, 0, 0, 0;
        0, #x, 0, 0, 0, 0, #x, 0, 0, 0, #x, 0, 0, 0, #x ;
        #x, 0, 0, #x, #x, 0, 0, #x, 0, 0, #x, 0, #x, #x, #x ;
        0, 0, #x, 0, 0, 0, 0, 0, #x, 0, #x, 0, 0, #x, 0;
        0, 0, 0, 0, 0, #x, 0, 0, 0, #x, 0, 0, #x, 0, 0;
        0, 0, 0, 0, 0, 0, #x, #x, #x, 0, #x, 0, 0, 0, #x ;
        0, 0, 0, #x, #x, 0, 0, 0, 0, 0, 0, #x, 0, 0, 0;
        0, 0, 0, 0, 0, 0, 0, #x, 0, #x, 0, 0, #x, 0, 0;
        0, 0, 0, 0, 0, 0, 0, #x, #x, 0, 0, 0, 0, #x, 0;
        0, 0, 0, 0, 0, 0, #x, #x, 0, 0, #x, 0, 0, 0, #x ;
    )
$

There is only 1 diagonal block but we can compute this again to find that it yet
again is unable to reduce it as it find another trivial permutation vector:

$
    p = [3, 4, 5,   6,   7,   8,   9,   10,  11,  12,  13,  14, 15, 2, 1 ]
$

This is beacuse each time this process has found an eigenvector that that has
all the same values. This process is very good at finding even blocks and in
this situation it appears to be unable to which means than the process will have
no speedup from parellization.

#h(1fr) $ballot$

= Problem 4

We can create a rooted tree for the graph by first checking node 1 as a root.

#diagraph.raw-render(```
digraph RootedTree {
    rankdir=TB; // Top to bottom
    nodesep=0.2;
    ranksep=0.4;

    // shape=cirle;
    // Styling the root node specifically
    // 
    node [shape=circle, width=0.3, fixedsize=true] // , style=filled, color=lightblue];
    edge [arrowsize=0.6]

    // Defining relationships
    1 -> {4, 6, 8};

    6 -> {10};
    4 -> {5, 12};
    8 -> {5, 11, 13, 14, 15};
    15 -> {7}
    11 -> {7, 9}
    14 -> {9}
    9 -> {3}
    7 -> {2}
}
```)

I will choose 2 to be the new root and recreate the graph:

#diagraph.raw-render(```
digraph RootedTree {
    rankdir=TB; // Top to bottom
    nodesep=0.2;
    ranksep=0.4;

    node [shape=circle, width=0.3, fixedsize=true] // style=filled, color=lightblue
    edge [arrowsize=0.6]

    2 -> {7}

    7 -> {11, 15}

    11 -> {8, 9}
    15 -> {8}

    9 -> {3, 14}
    8 -> {1, 4, 5, 13, 14}

    4 -> {12}
    5 -> {12}
    13 -> {10}
    1 -> {6}
}
```)

This is the final tree structure and I will be removing nodes 8 and 9. This
creates the permutation vector as follows:
$
    p = [2, 7, 11, 15, 1, 3, 4, 5, 13, 14, 6, 12, 10, 8, 9]
$

Which results in the following matrix:
$
    mat(
    #x, #x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    #x, #x, #x, #x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
    0, #x, #x, #x, 0, 0, 0, 0, 0, 0, 0, 0, 0, #x, #x ;
    0, #x, #x, #x, 0, 0, 0, 0, 0, 0, 0, 0, 0, #x, 0;
    0, 0, 0, 0, #x, 0, #x, 0, 0, 0, #x, 0, 0, #x, 0;
    0, 0, 0, 0, 0, #x, 0, 0, 0, 0, 0, 0, 0, 0, #x ;
    0, 0, 0, 0, #x, 0, #x, #x, 0, 0, 0, #x, 0, #x, 0;
    0, 0, 0, 0, 0, 0, #x, #x, 0, 0, 0, #x, 0, #x, 0;
    0, 0, 0, 0, 0, 0, 0, 0, #x, 0, 0, 0, #x, #x, 0;
    0, 0, 0, 0, 0, 0, 0, 0, 0, #x, 0, 0, 0, #x, #x ;
    0, 0, 0, 0, #x, 0, 0, 0, 0, 0, #x, 0, #x, 0, 0;
    0, 0, 0, 0, 0, 0, #x, #x, 0, 0, 0, #x, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 0, 0, #x, 0, #x, 0, #x, 0, 0;
    0, 0, #x, #x, #x, 0, #x, #x, #x, #x, 0, 0, 0, #x, 0;
    0, 0, #x, 0, 0, #x, 0, 0, 0, #x, 0, 0, 0, 0, #x;
 )
$

To continue this process we must ignore all the rows we have already permuted,
that is to say we only consider the section below the cut line in our graph:
$
    p' = [1, 3, 4, 5, 13, 14, 6, 12, 10] \
    mat(
    #x, 0, #x, 0, 0, 0, #x, 0, 0;
    0, #x, 0, 0, 0, 0, 0, 0, 0;
    #x, 0, #x, #x, 0, 0, 0, #x, 0;
    0, 0, #x, #x, 0, 0, 0, #x, 0;
    0, 0, 0, 0, #x, 0, 0, 0, #x ;
    0, 0, 0, 0, 0, #x, 0, 0, 0;
    #x, 0, 0, 0, 0, 0, #x, 0, #x ;
    0, 0, #x, #x, 0, 0, 0, #x, 0;
    0, 0, 0, 0, #x, 0, #x, 0, #x ;
 )
$

We can again construct a new chart for this smaller matrix (note I have reindex
the nodes so the permutation vector created here will have to act on the $p'$
above):

#columns(2, gutter: 8pt)[

#diagraph.raw-render(```
digraph RootedTree {
    rankdir=TB; // Top to bottom
    nodesep=0.2;
    ranksep=0.4;

    node [shape=circle, width=0.3, fixedsize=true] // style=filled, color=lightblue
    edge [arrowsize=0.6]

    1 -> {3, 7}
    3 -> {4, 8}
    7 -> {9}
    9 -> {5}
    2 6
}
```,
    // label: ("n1": 1)
)

#diagraph.raw-render(```
digraph RootedTree {
    rankdir=TB; // Top to bottom
    nodesep=0.2;
    ranksep=0.4;

    node [shape=circle, width=0.3, fixedsize=true] // style=filled, color=lightblue
    edge [arrowsize=0.6]

    5 -> {9}
    9 -> {7}
    7 -> {1}
    1 -> {3}
    3 -> {4, 8}
    2 6
}
```,
    // label: ("n1": 1)
)
]

Thus we can choose 1 as the block divider. This creates the permutation:
$
    p = [5, 9, 7, 3, 4, 8, 1, 2, 6]
$

However, this is a permutation of the permutation so by ordering then
subsituting we get:

$

    p' = [1, 3, 4, 5, 13, 14, 6, 12, 10] \
    p = [13, 10, 6, 4, 5, 12, 1, 3, 14]\ 
    p = [2, 7, 11, 15 | 13, 10, 6, 4, 5, 12, 1, 3, 14 | 8, 9]
$

#align(center)[
#math.mat(
    (x, x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (x, x, x, x, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    (0, x, x, x, 0, 0, 0, 0, 0, 0, 0, 0, 0, x, x),
    (0, x, x, x, 0, 0, 0, 0, 0, 0, 0, 0, 0, x, 0),
    (0, 0, 0, 0, x, x, 0, 0, 0, 0, 0, 0, 0, x, 0),
    (0, 0, 0, 0, x, x, x, 0, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 0, 0, 0, x, x, 0, 0, 0, x, 0, 0, 0, 0),
    (0, 0, 0, 0, 0, 0, 0, x, x, x, x, 0, 0, x, 0),
    (0, 0, 0, 0, 0, 0, 0, x, x, x, 0, 0, 0, x, 0),
    (0, 0, 0, 0, 0, 0, 0, x, x, x, 0, 0, 0, 0, 0),
    (0, 0, 0, 0, 0, 0, x, x, 0, 0, x, 0, 0, x, 0),
    (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, x, 0, 0, x),
    (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, x, x, x),
    (0, 0, x, x, x, 0, 0, x, x, 0, x, 0, x, x, 0),
    (0, 0, x, 0, 0, 0, 0, 0, 0, 0, 0, x, x, 0, x)
)]

This matrix is much better for parellization as you can see 3 distinct (evenly
sized) blocks in addtion to the edges (which take another processor) compared to
problem 3 which has very few blocks.

#h(1fr) $ballot$

= Code

I used lots of suplimental julia code to help me do this project. It is
presented bellow if you are interested:

#let julia = read("elen162-project2.jl")
#show raw: set text(0.5em)
#raw(julia, lang: "julia")
