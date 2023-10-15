import 'package:flutter/material.dart';

class FirstScreenExample extends StatelessWidget {
  const FirstScreenExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: column1(),
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
          onPressed: () {},
          child: const Text('Aperte o botão!'),
        ),
      ],
    );
  }
}
