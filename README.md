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

# flutter_chat_reactions

`flutter_chat_reactions` Enhance your Flutter chat with expressive reactions.
Need a simple and powerful way to add customizable message reactions to your Flutter chat app? Look no further than flutter_chat_reactions!

![Demo GIF of flutter_chat_reactions](flutter_chat_reaction/flutter_chat_reaction_gif.gif)

## Features

 - `endless` and `bouncing` modes
 - delay and pause between rounds
 - max number of rounds
 - custom velocity
 - `style` and `textAlign` support

## Getting started

To use this package, add text_scroll as a dependency in your pubspec.yaml file.

## Usage

Minimal example:

```dart
    TextScroll('This is the sample text for Flutter TextScroll widget. ')
```

Custom settings:

```dart
    TextScroll(
        'This is the sample text for Flutter TextScroll widget. ',
        mode: TextScrollMode.bouncing,
        velocity: Velocity(pixelsPerSecond: Offset(150, 0)),
        delayBefore: Duration(milliseconds: 500),
        numberOfReps: 5,
        pauseBetween: Duration(milliseconds: 50),
        style: TextStyle(color: Colors.green),
        textAlign: TextAlign.right,
        selectable: true,
    )
```

## See also

 - [github repo](https://github.com/yurii-khi/text_scroll)
 - [pub.dev package](https://pub.dev/packages/text_scroll)
 - [api reference](https://pub.dev/documentation/text_scroll/latest/text_scroll/TextScroll-class.html)
