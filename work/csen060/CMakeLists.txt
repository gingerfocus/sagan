cmake_minimum_required(VERSION 3.5)

project(uni LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(uni src/main.cpp)

add_executable(hw1-sol1 src/hw1/sol1.cpp)
add_executable(hw1-sol2 src/hw1/sol2.cpp)

add_executable(lab02-sol1 src/lab02/sol1.cpp)
add_executable(lab02-sol2 src/lab02/sol2.cpp)

add_executable(hw2 src/hw2/sol2.cpp)

add_executable(lab03 src/lab03/sol1.cpp)

add_executable(lab04-sol1 src/lab04/point.cpp)
add_executable(lab04-sol2 src/lab04/triangle.cpp)

add_executable(lab05 src/lab05/sol1.cpp)

add_executable(hw4 src/hw4/speller.cpp)

add_executable(hw5 src/hw5/biguint.cpp)

add_executable(lab07 src/lab07/explain.cpp)

add_executable(hw6 src/hw6/Biguint.cpp)

add_executable(hw7 src/hw7/p3.cpp src/node.cpp src/hw7/test.cpp)

add_executable(lab08 src/lab08/p1.cpp src/node.cpp)

add_executable(lab09 src/lab09/test.cpp src/lab09/dnode.cpp)
add_executable(lab10 src/lab10/test.cpp)

add_executable(hw9 src/hw9/test.cpp src/hw9/Biguint.cpp src/hw9/Bigint.cpp)

# include(GNUInstallDirs)
#
# install(TARGETS uni
#     LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
#     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
# )
