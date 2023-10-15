import 'package:first_flutter_project/exercises/exercise_01.dart';
import 'package:first_flutter_project/exercises/exercise_03.dart';
import 'package:first_flutter_project/task_cards/task_cards.dart';
import 'package:first_flutter_project/exercises/first_screen_example.dart';
import 'package:flutter/material.dart';

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
      home: invoqueTaskCards(),
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

  Widget invoqueTaskCards() {
    TaskCards taskCards = const TaskCards();
    return taskCards;
  }

  Widget invoqueExercise03(BuildContext context) {
    Exercise03 exercise03 = const Exercise03();
    return exercise03.build(context);
  }
}
