# Add one source file per component as you build them, e.g. order_book_bench.cpp.
add_executable(venue_bench
  smoke_bench.cpp
)
target_link_libraries(venue_bench PRIVATE venue::venue benchmark::benchmark_main)
venue_set_warnings(venue_bench)
