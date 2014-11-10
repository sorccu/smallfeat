# smallfeat

**smallfeat** is a tiny program to display an Android device's [CPU features](https://android.googlesource.com/platform/ndk/+/master/sources/android/cpufeatures/cpu-features.h) (check your NDK Programmer's Guide for details). Mostly for curiosity purposes, but can sometimes be useful when tweaking compiler flags.

Does not require root.

## Requirements

* [NDK](https://developer.android.com/tools/sdk/ndk/index.html) 10c

## Building

Just run `ndk-build`. Currently only NDK 10c has been tested.

Note that you'll get two binaries per target ABI, `smallfeat` (as a Position Independent Executable or PIE) and `smallfeat-nopie` (without PIE). The latter can only run on pre Android 5.0 devices, but supports very old devices. The PIE version supports Android 5.0 but requires Android 4.1 or later (otherwise it segfaults).

## Running

A small run script is included for convenience purposes. It builds the project with `ndk-build`, uploads the correct binary with `adb push` and runs it via `adb shell`. You should have a single device connected, or alternatively just export `ANDROID_SERIAL` to select a device.

```bash
ANDROID_SERIAL=abc123 ./run.sh
```

Discard STDERR for cleaner output:

```bash
ANDROID_SERIAL=abc123 ./run.sh 2>/dev/null
```

Check [run.sh](run.sh) for the list of commands if you want to do it yourself.

Example output from Galaxy Tab S 8.4 LTE:

```
ANDROID_CPU_COUNT=4
ANDROID_CPU_FAMILY_ARM
ANDROID_CPU_ARM_FEATURE_VFPv3
ANDROID_CPU_ARM_FEATURE_NEON
ANDROID_CPU_ARM_FEATURE_LDREX_STREX
ANDROID_CPU_ARM_FEATURE_VFPv2
ANDROID_CPU_ARM_FEATURE_VFP_D32
ANDROID_CPU_ARM_FEATURE_VFP_FP16
ANDROID_CPU_ARM_FEATURE_VFP_FMA
ANDROID_CPU_ARM_FEATURE_NEON_FMA
ANDROID_CPU_ARM_FEATURE_IDIV_ARM
ANDROID_CPU_ARM_FEATURE_IDIV_THUMB2
```

Example output from Moto 360:

```
ANDROID_CPU_COUNT=1
ANDROID_CPU_FAMILY_ARM
ANDROID_CPU_ARM_FEATURE_VFPv3
ANDROID_CPU_ARM_FEATURE_NEON
ANDROID_CPU_ARM_FEATURE_LDREX_STREX
ANDROID_CPU_ARM_FEATURE_VFPv2
ANDROID_CPU_ARM_FEATURE_VFP_D32
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

See [LICENSE](LICENSE).
