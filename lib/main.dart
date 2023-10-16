import 'package:first_flutter_project/data/task_cards_inherited.dart';
import 'package:first_flutter_project/task_cards/task_cards_page.dart';
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
      home: TaskCardsInherited(child: const TaskCardsPage()),
    );
  }
}
