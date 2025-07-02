# Steve's Flutter Design System

My personal design system to facilitate the creation of webapps using Flutter.

Key packages used in the design system:

- [shared_preferences](https://pub.dev/packages/shared_preferences) (persistent storage)
- [go_router](https://pub.dev/packages/go_router) (routing)
- [riverpod](https://pub.dev/packages/riverpod) (state management)

## Table of contents

1. [Installing](#installing)
2. [Project configuration](#project-configuration)
   1. [Lints](#lints)
   2. [Fonts](#fonts)

## Installing

Add the following dependency in pubspec.yaml:

```
dependencies:
  sfds:
    git:
      url: https://github.com/SDC-Consulting-BE/sfds
      ref: main
```

## Project configuration

### Lints

Add the following include at the top of the analysis_options.yaml:

```
include: package:sfds/analysis_options.yaml
```

### Fonts

Add the following entries in analysis_options.yaml:

```
flutter:
  fonts:
    - family: base
      fonts:
        - asset: packages/sfds/assets/font/thin.ttf
          weight: 100
        - asset: packages/sfds/assets/font/thinItalic.ttf
          weight: 100
          style: italic
        - asset: packages/sfds/assets/font/light.ttf
          weight: 300
        - asset: packages/sfds/assets/font/lightItalic.ttf
          weight: 300
          style: italic
        - asset: packages/sfds/assets/font/regular.ttf
          weight: 400
        - asset: packages/sfds/assets/font/italic.ttf
          weight: 400
          style: italic
        - asset: packages/sfds/assets/font/medium.ttf
          weight: 500
        - asset: packages/sfds/assets/font/mediumItalic.ttf
          weight: 500
          style: italic
        - asset: packages/sfds/assets/font/bold.ttf
          weight: 700
        - asset: packages/sfds/assets/font/boldItalic.ttf
          weight: 700
          style: italic
        - asset: packages/sfds/assets/font/black.ttf
          weight: 900
        - asset: packages/sfds/assets/font/blackItalic.ttf
          weight: 900
          style: italic
```
