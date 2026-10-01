// Checks that Google Benchmark is wired up. Delete once real benchmarks exist.
#include <benchmark/benchmark.h>

#include <cstdint>

static void BM_Noop(benchmark::State& state) {
  std::uint64_t x = 0;
  for (auto _ : state) {
    benchmark::DoNotOptimize(++x);
  }
}
BENCHMARK(BM_Noop);
