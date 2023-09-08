# Drop Link

A Flutter Web plugin to handle drag-and-drop (files) into Flutter. If you're interested in drag-and-drop inside a Flutter app, check out other packages like dnd.


* [Getting Started](#getting-started)
* [Installation](#installation)
* [Usage](#usage)
* [Example App](https://github.com/KalybosPro/drop_link/tree/main/example)

## Getting Started

This flutter plugin help to drop link in flutter web app.

## Installation

This plugin is available on Pub: [https://pub.dev/packages/drop_link](https://pub.dev/packages/drop_link)

Add this to `dependencies` in your app's `pubspec.yaml`

```yaml
drop_link: ^0.0.1
```

## Usage

Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart).

#### Import package

```dart
import 'package:drop_link/drop_link.dart';
```

#### Example

```dart
import 'package:dotted_border/dotted_border.dart';
import 'package:drop_link/drop_link.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drop link zone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   String? link;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drop link zone"),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 500,
          alignment: Alignment.center,
          child: DropLinkZone(
            onDrop: (data) {
              debugPrint(data);
              setState(() {
                link = data;
              });
            },
            child: DottedBorder(
              color: Colors.black.withOpacity(0.4),
              strokeWidth: 2,
              dashPattern: const [4, 2],
              radius: const Radius.circular(3),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: link!=null? Center(child: Text("$link")): Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Spacer(),
                    ClipRRect(
                      child:  Icon(Icons.link),
                    ),
                    Spacer(),
                    Text("Drop your link here"),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

```
