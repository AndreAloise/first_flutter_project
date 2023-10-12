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
      home: column1(),
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
        )
      ],
    );
  }

  Row row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          color: Colors.red,
          width: 150,
          height: 150,
        ),
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
    );
  }
}
