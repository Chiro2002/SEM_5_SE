cmake_minimum_required(VERSION 3.16.3)

project(Bptree)
include_directories(HEADER_FILES)
file(GLOB MAIN
        "SOURCE_FILES/*.c"
        "HEADER_FILES/*.h"
)

file(COPY ${CMAKE_SOURCE_DIR}/input.txt DESTINATION ${CMAKE_BINARY_DIR})
file(COPY ${CMAKE_SOURCE_DIR}/master.txt DESTINATION ${CMAKE_BINARY_DIR})
file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/DBFiles)
add_executable(executable ${MAIN})
