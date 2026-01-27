import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool EraseMode = false;

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
              isErasing: EraseMode,
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

            Positioned( //zoom in
              bottom: 88,
              right: 16,
              child: FloatingActionButton(
                onPressed: () => man.clear(),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(Icons.zoom_in),
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

            Positioned( //Eraser Button
              bottom: 88,
              left: 16,
              child: FloatingActionButton(
                onPressed: () => setState(() {
                  EraseMode = !EraseMode;
                }),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(FontAwesomeIcons.eraser),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
