import 'package:first_flutter_project/first_screen_example.dart';
import 'package:flutter/material.dart';

import 'exercise_01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: invoqueFirstScreenExample(context),
      //home: invoqueExercise01(context),
    );
  }

  Widget invoqueFirstScreenExample(BuildContext context) {
    FirstScreenExample firstScreen = const FirstScreenExample();
    return firstScreen.build(context);
  }

  Widget invoqueExercise01(BuildContext context) {
    Exercise01 exe01 = const Exercise01();
    return exe01.build(context);
  }
}
