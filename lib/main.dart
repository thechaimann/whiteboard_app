import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WhiteBoardController man;
  bool eraseMode = false;
  double penSize = 4.0;

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
              strokeWidth: penSize,
              isErasing: eraseMode,
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

            Positioned( //Save button
              bottom: 88,
              right: 16,
              child: FloatingActionButton(
                onPressed: () => man.convertToImage(),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(Icons.save),
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
                  eraseMode = !eraseMode;
                }),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
                child: const Icon(FontAwesomeIcons.eraser),
              ),
            ),
          
            Positioned( //slider
              top: 40,
              left: 16,
              right: 16,
              child: SizedBox(
                width: 20,
                child: SliderTheme
                (
                  data: SliderThemeData(
                    thumbColor: Colors.cyan,
                    activeTrackColor: Colors.cyan,
                    inactiveTrackColor: Colors.cyan.withOpacity(0.3),
                  ),
                  child: Slider(
                    value: penSize,
                    min: 1.0,
                    max: 50.0,
                    divisions: 40,
                    onChanged: (size) {
                      setState(() {
                        penSize = size;
                      });
                    },
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
