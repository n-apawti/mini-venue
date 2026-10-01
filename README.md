# mini-venue

A mini trading venue in C++20: matching engine, market-data feed and market-making client, benchmarked end to end.

## Build

Requires Linux (or WSL2), CMake ≥ 3.22, Ninja and GCC ≥ 11 or Clang ≥ 14. GoogleTest and Google Benchmark are fetched automatically.

```sh
cmake --preset debug && cmake --build --preset debug && ctest --preset debug
```

| Preset    | Purpose                              |
| --------- | ------------------------------------ |
| `debug`   | Day-to-day development               |
| `asan`    | AddressSanitizer + UBSan             |
| `tsan`    | ThreadSanitizer                      |
| `release` | `-O3` build for benchmarks           |

Run benchmarks:

```sh
cmake --preset release && cmake --build --preset release
./build/release/bench/venue_bench
```

## Layout

```
include/venue/   public headers
src/             library sources
tests/           GoogleTest unit tests
bench/           Google Benchmark microbenchmarks
```
