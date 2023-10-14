import 'package:flutter/material.dart';

class Exercise02 extends StatelessWidget {
  const Exercise02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      floatingActionButton: _floatingButton(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Flutter: Meus primeiros passos!'),
    );
  }

  Container _body() {
    return Container(
      color: Colors.black,
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {},
    );
  }
}
