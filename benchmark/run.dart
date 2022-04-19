import 'dart:io';

import 'package:benchmark_harness/benchmark_harness.dart';
import 'package:imul/imul.dart';

import 'data.dart';

abstract class WarmingBenchmarkBase extends BenchmarkBase {
  const WarmingBenchmarkBase(String name) : super(name);

  @override
  void report() {
    BenchmarkBase.measureFor(warmup, 2000);
    super.report();
  }
}

class ImulBenchmark extends WarmingBenchmarkBase {
  const ImulBenchmark() : super('imul');

  @override
  void run() {
    for (int i = 0; i < testData.length; i++) {
      imul(testData[i][0], testData[i][1]);
    }
  }
}

class Imul2Benchmark extends WarmingBenchmarkBase {
  const Imul2Benchmark() : super('imul2');

  @override
  void run() {
    for (int i = 0; i < testData.length; i++) {
      imul2(testData[i][0], testData[i][1]);
    }
  }
}

void main() {
  const ImulBenchmark().report();
  const Imul2Benchmark().report();
}
