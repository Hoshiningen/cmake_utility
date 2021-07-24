# CMake Utility Files

This repository contains a collection of helpful CMake files that support common operations in project configurations.

## Usage

The recommended usage for this repository is to fetch it via CMake:

```cmake
include(FetchContent)

FetchContent_Declare(
    cmake_utility
    GIT_REPOSITORY https://github.com/Hoshiningen/cmake_utility
)

FetchContent_GetProperties(cmake_utility)

if (NOT cmake_utility_POPULATED)
    FetchContent_Populate(cmake_utility)
endif()
```

Then include the specific files you're interested in:

```cmake
include(${cmake_utility_SOURCE_DIR}/cmake/google/LinkGBenchmark.cmake)
LinkGBenchmark(<target> PRIVATE v1.5.5)
```

Using `FetchContent`, CMake will download the repository during configure time, and will store the contents in your build directory at `_deps/cmake_utility-src`. This directory is what's returned in the CMake variable `cmake_utility_SOURCE_DIR`.