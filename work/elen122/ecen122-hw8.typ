#import "@local/pset:0.1.0" as pset
#show: pset.ieee.with(title: "ECEN122 - Homework 8", columns: 1, author: "Evan Stokdyk")

#set text(16pt)
#show table: it => align(center)[#it]
#show raw: set text(9pt)

= Problem 1

Cache miss arate decreasse for all meomry size when changing the block size from
16 to 32 bits as the relative amount of data used to contain the 

As such a doubling of the block line results in less bits for the tag and index causing less diferent values to be evicted.

The misses increase from 128 to 256 beacuse 

there can only be very few blocks in memory now and so the memory frequently is having to 

= Problem 2

Given that there is a block line of 16 bytes that means that the bottom 4 bits
of the address are used as the index and ignored. The index bits can be found as
such:
$
    log_2("mem_size" / "block_size" / "set_assositivity") &= \
    log_2(64 dot 1024 / 16 / 2) &= 11
$

Thus, the tag bits are:
$
    32 - (11 + 4) = 17
$

#table(
    columns: 4,
    [Address], [Tag], [Index], [Miss],
    [0x0ABCDE00], [0x0ABC1], [0x5E0], [X], 
    [0x0ABCDE02], [0x0ABC1], [0x5E0], [], 
    [0x0BBCDF00], [0x0BBC1], [0x5F0], [X], 
    [0x0BBCDF02], [0x0BBC1], [0x5F0], [], 
    [0x0CBCDF00], [0x0CBC1], [0x5F0], [X], 
    [0x0ABCDE04], [0x0ABC1], [0x5E0], [], 
    [0x0BBCDF04], [0x0BBC1], [0x5F0], [], 
    [0x0CBCDF04], [0x0CBC1], [0x5F0], [], 
)

We can use an optimal caching which makes no change as this already has no
misses for 2 way associativity

0xABCDE00
0xABCDE02
0xBBCDF00
0xBBCDF02
0xCBCDF00
0xABCDE04
0xBBCDF04
0xCBCDF04

The tag size will be X for 4 way associativity. And thiis si the caching for
4-way associtivity:

0xABCDE00
0xABCDE02
0xBBCDF00
0xBBCDF02
0xCBCDF00
0xABCDE04
0xBBCDF04
0xCBCDF04

= Problem 3 

LRU is difficult to implement in hardware beacuse knowing when is cumbersome.
Requires keeping track of numbers for each cache. Can require many updates for
one read. As such the external effects build up.  The article mentions that
having high assositivity results in more hardware. A true LRU implementation
requires that any block from memory be able to be placed within any block of
chache. More realistically, memory blocks have 4 or 8 prospective location and
must make the best choice with its options.
