include(GoogleTest)

# Add one source file per component as you build them, e.g. order_book_test.cpp.
add_executable(venue_tests
  smoke_test.cpp
)
target_link_libraries(venue_tests PRIVATE venue::venue GTest::gtest_main GTest::gmock)
venue_set_warnings(venue_tests)

# PRE_TEST: list tests when ctest runs, not at build time, so sanitizer
# runtime settings (env vars, ASLR) apply to discovery as well.
gtest_discover_tests(venue_tests DISCOVERY_MODE PRE_TEST DISCOVERY_TIMEOUT 30)
