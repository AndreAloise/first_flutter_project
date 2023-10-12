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
      //home: Container(color: Colors.white, child: column1()),
      home: invoqueExercise01(context),
    );
  }

  Column column1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.blue,
              width: 75,
              height: 75,
            ),
            Container(
              color: Colors.yellow,
              width: 37,
              height: 37,
            )
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: Colors.yellow,
              width: 75,
              height: 75,
            ),
            Container(
              color: Colors.blue,
              width: 37,
              height: 37,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              width: 50,
              height: 50,
            ),
            Container(
              color: Colors.orange,
              width: 50,
              height: 50,
            ),
            Container(
              color: Colors.purple,
              width: 50,
              height: 50,
            )
          ],
        ),
        Container(
          color: Colors.amber,
          height: 30,
          width: 300,
          child: const Text(
            'Diamante amarelo',
            style: TextStyle(color: Colors.black, fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(
          onPressed: buttonFunc1,
          child: const Text('Aperte o botão!'),
        ),
      ],
    );
  }

  void buttonFunc1() {
    print('Você apertou o botão!');
  }

  Widget invoqueExercise01(BuildContext context) {
    Exercise01 exe01 = const Exercise01();
    return exe01.build(context);
  }
}
