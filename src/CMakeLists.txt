# Core library. Header-only for now; switch to add_library(venue STATIC ...)
# once the first .cpp files exist.
add_library(venue INTERFACE)
add_library(venue::venue ALIAS venue)
target_include_directories(venue INTERFACE ${PROJECT_SOURCE_DIR}/include)
target_compile_features(venue INTERFACE cxx_std_20)
