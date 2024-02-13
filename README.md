# SETUP

Widget that allows a child widget and opacity to be animated. Ideally used to add animation (and opacity) to reveal/hide widgets

<!--
The comments below are from the Flutter/Dart package generation. Feel free to use or ignore
-->

<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

Size or Size & Opacity can be animated.

## Getting started

```yaml
dependencies:
  ui_animated_size_and_opacity_flutter:
    git: https://github.com/GitHubStuff/ui_animated_size_and_opacity_flutter.git
```

Create a **UIAnimatedSizeAndOpacityCubit** and include a **BlocProvider** in the widget tree to access the cubit.

```dart
@override
  Widget build(BuildContext context) {
    return BlocProvider<UIAnimatedSizeAndOpacityCubit>(
      create: (context) => cubit,               // The cubit
      child: Scaffold(
        body: homeWidget(context),
        floatingActionButton: null,
      ),
    );
  }
```

## Usage

In the widget tree:

```dart
        UIAnimatedSizeAndOpacity(
            expandableAnimatedCubit: cubit,
            size: const Size(125, 125),
            child: Assets.images.demo.image(),
          )
```

## Additional information

Only **expandableAnimatedCubit:**, **size:**, and **child:** are required

The declaration:

```dart
const UIAnimatedSizeAndOpacity({
    super.key,
    required this.expandableAnimatedCubit,
    required this.size,
    this.animateOpacity = true,
    this.curve = Curves.easeInOut,
    this.duration = const Duration(milliseconds: 500),
    this.expandableType = ExpansionEnum.dropdown,
    this.minimalSize = const Size(0.0, 0.0),
    this.onEnd,
    required this.child,
  });
```

*See **/example** for demo*

## Finally

***Be kind to each other!***
