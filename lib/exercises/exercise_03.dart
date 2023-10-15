import 'package:flutter/material.dart';

class Exercise03 extends StatelessWidget {
  const Exercise03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }

  AppBar _appBar() {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: Icon(Icons.check_circle_outline_rounded, size: 24.0),
          ),
          Text('Flutter: Primeiros passos!'),
        ],
      ),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    );
  }

  ListView _body() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        FlagEx03(Colors.black, Colors.blue, Colors.green),
        FlagEx03(Colors.deepPurpleAccent, Colors.teal, Colors.red),
        FlagEx03(Colors.deepPurpleAccent, Colors.indigo, Colors.purple),
        FlagEx03(Colors.grey, Colors.lightGreenAccent, Colors.yellow),
        FlagEx03(Colors.pink, Colors.blueGrey, Colors.brown),
        FlagEx03(Colors.cyan, Colors.deepOrange, Colors.amber),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}

class FlagEx03 extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;
  const FlagEx03(this.firstColor, this.secondColor, this.thirdColor, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _bodyPadding();
  }

  Padding _bodyPadding() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          child: _stackChildren(),
        ));
  }

  Stack _stackChildren() {
    return Stack(
      children: [
        Row(
          children: [
            _flagContainer(firstColor, false),
            _flagContainer(secondColor, true),
            _flagContainer(thirdColor, false),
          ],
        )
      ],
    );
  }

  Container _flagContainer(Color color, bool shouldHasImage) {
    return Container(
      color: null,
      height: 140,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.circular(20),
          color: color),
      child: shouldHasImage
          ? Image.network(
              'https://www.ziliongames.com.br/banco_imagens/produtos/g/ronaldinho-soccer-super-nintendo-seminovo1K11.png',
            )
          : null,
    );
  }
}
