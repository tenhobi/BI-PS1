cmake_minimum_required(VERSION 3.6)
project(01_zahrivaci-uloha)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -pedantic -std=c99")

set(SOURCE_FILES main.c)
add_executable(01_zahrivaci-uloha ${SOURCE_FILES})
