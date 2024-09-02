import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queen_puzzle/pages/queens_puzzle/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'N Queens Puzzle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QueensPuzzlePage(),
    );
  }
}
