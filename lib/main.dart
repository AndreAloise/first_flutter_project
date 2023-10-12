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
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            width: 300,
            height: 300,
          ),
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
      ),
    );
  }
}
