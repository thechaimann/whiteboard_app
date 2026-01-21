import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WhiteBoardController man;

  @override
  void initState() {
    super.initState();
    man = WhiteBoardController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whiteboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Whiteboard')),
        body: Stack(
          children: [
            // Whiteboard
            WhiteBoard(
              controller: man,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              strokeWidth: 4.0,
            ),

            // Floating button
            Positioned( //clear button
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: () => man.clear(),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(Icons.clear),
              ),
            ),

            Positioned( // Redo button
              bottom: 16,
              left: 16,
              child: FloatingActionButton(
                onPressed: () => man.redo(),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(Icons.redo),
              ),
            ),

            Positioned( //Undo Button
              bottom: 88,
              left: 16,
              child: FloatingActionButton(
                onPressed: () => man.undo(),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(Icons.undo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
