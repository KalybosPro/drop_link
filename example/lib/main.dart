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
