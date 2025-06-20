# Steve's Flutter Design System

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
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-Thin.ttf
          weight: 100
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-ThinItalic.ttf
          weight: 100
          style: italic
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-Light.ttf
          weight: 300
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-LightItalic.ttf
          weight: 300
          style: italic
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-Regular.ttf
          weight: 400
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-Italic.ttf
          weight: 400
          style: italic
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-Medium.ttf
          weight: 500
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-MediumItalic.ttf
          weight: 500
          style: italic
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-Bold.ttf
          weight: 700
        - asset: packages/sfds/assets/fonts/Roboto/Roboto-BoldItalic.ttf
          weight: 700
          style: italic
```
