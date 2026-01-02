
# Command & Conquer Red Alert

This repository is a non-affiliated fork of the [official Command & Conquer Red Alert repository](https://github.com/electronicarts/CnC_Red_Alert) owned by [EA](https://github.com/electronicarts).

## Purpose

This fork of Command & Conquer Red Alert is an experimental repository used for studying how to port and build source code from 1995 using modern build tools and coding standards.

Specifically, the goal of this repository is to take the original source code of Red Alert and make it compilable for modern Windows using the Visual Studio Build Tools and CMake.

This fork will only focus on compiling the source code for Windows targeting the x86 architecture.

## Wiki

Consult the [Wiki](https://github.com/fredrikhr/CnC_Red_Alert/wiki) for this fork for technical information regarding the source code transformation and the transition to the modern build system.

## Compare to Original Source

Since this is a fork of a public GitHub repository you can of course always simply compare this fork to the original repository.

[Compare to `electronicarts/CnC_Red_Alert`](https://github.com/electronicarts/CnC_Red_Alert/compare/main...fredrikhr:CnC_Red_Alert:HEAD)

However, the further this fork moves from the original source, this will become less practical. Therefore, a new branch `baseline` is created in this fork. All commits that do not strictly modify the original source code will be placed on that branch (with occasional rebasing and restructuring). As a result the compare between the `main` and `baseline` branches of this fork should offer a better overview of the actual source code changes:

[Compare to `baseline`](https://github.com/fredrikhr/CnC_Red_Alert/compare/baseline...HEAD)

Similarly, the comparison between the `baseline` branch of this repository and the original source code should present what files were added or removed to facilitate building the source code using modern tools.

[Compare `baseline` to `electronicarts/CnC_Red_Alert`](https://github.com/electronicarts/CnC_Red_Alert/compare/main...fredrikhr:CnC_Red_Alert:baseline)

## Usage

Artifacts contained within or produced from this repository are for study purposes only.

To use the compiled binaries, you must own the game. The C&C Ultimate Collection is available for purchase on [EA App](https://www.ea.com/en-gb/games/command-and-conquer/command-and-conquer-the-ultimate-collection/buy/pc) or [Steam](https://store.steampowered.com/bundle/39394/Command__Conquer_The_Ultimate_Collection/).

## License

This original repository and its contents are licensed under the GPL v3 license, with additional terms applied. Please see [LICENSE.md](LICENSE.md) for details.
