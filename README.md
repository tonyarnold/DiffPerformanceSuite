# Diff Performance Suite

These are a set of very simplistic benchmarks for recording the difference in calculation time between the different diff implementations.

Each measurement is the mean time in seconds it takes to calculate a diff, over 10 runs on an iPhone 6.

|         |   Diff    | Dwifft  |
|---------|:----------|:--------|
| same    |  0.0213   | 52.3642 |
| created |  0.0188   | 0.0033  |
| deleted |  0.0184   | 0.0050  |
| diff    |  0.1320   | 63.4084 |

## Instructions

You can run these benchmarks yourself:

```sh
swift run -c release PerformanceTester Sources/PerformanceTester/Samples/Diff-old.swift Sources/PerformanceTester/Samples/Diff-new.swift
```

## Requirements

Diff Performance Suite requires Swift 4 / Xcode 9 or later to compile.

## Contributions

I'd love to see more implementations benchmarked, so feel free to open a pull request!
