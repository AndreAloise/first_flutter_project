import 'package:first_flutter_project/exercise_02.dart';
import 'package:first_flutter_project/first_screen_example.dart';
import 'package:flutter/material.dart';

import 'exercise_01.dart';
import 'exercise_03.dart';

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
      //home: invoqueExercise03(context),
      home: invoqueExercise02(context),
      //home: invoqueFirstScreenExample(context),
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

  Widget invoqueExercise02(BuildContext context) {
    Exercise02 exercise02 = const Exercise02();
    return exercise02;
  }

  Widget invoqueExercise03(BuildContext context) {
    Exercise03 exercise03 = const Exercise03();
    return exercise03.build(context);
  }
}
