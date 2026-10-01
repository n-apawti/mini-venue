// Checks that the toolchain, GoogleTest and the include paths are wired up.
// Delete once real tests exist.
#include <gtest/gtest.h>

#include <venue/version.hpp>

TEST(Smoke, VersionIsDefined) {
  EXPECT_EQ(venue::kVersionMajor, 0);
  EXPECT_GE(venue::kVersionMinor, 1);
}
