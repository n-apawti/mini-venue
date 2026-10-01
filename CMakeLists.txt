cmake_minimum_required(VERSION 3.22)
project(mini_venue LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Build type" FORCE)
endif()

option(VENUE_BUILD_TESTS "Build unit tests" ON)
option(VENUE_BUILD_BENCHMARKS "Build benchmarks" ON)
option(VENUE_WARNINGS_AS_ERRORS "Treat compiler warnings as errors" OFF)
set(VENUE_SANITIZER "" CACHE STRING "Sanitizers to enable: '', 'address,undefined', or 'thread'")

# Sanitizers are applied globally (before dependencies are fetched) so that
# GoogleTest is instrumented too. TSan in particular reports false positives
# when only part of the program is instrumented.
if(VENUE_SANITIZER)
  message(STATUS "Sanitizers enabled: ${VENUE_SANITIZER}")
  add_compile_options(-fsanitize=${VENUE_SANITIZER} -fno-omit-frame-pointer -fno-sanitize-recover=all)
  add_link_options(-fsanitize=${VENUE_SANITIZER})
endif()

include(cmake/Dependencies.cmake)
include(cmake/Warnings.cmake)

add_subdirectory(src)

if(VENUE_BUILD_TESTS)
  enable_testing()
  add_subdirectory(tests)
endif()

if(VENUE_BUILD_BENCHMARKS)
  add_subdirectory(bench)
endif()
