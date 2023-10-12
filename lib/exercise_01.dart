import 'package:flutter/material.dart';

class Exercise01 extends StatelessWidget {
  const Exercise01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.red,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.orange,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.yellow,
                  width: 80,
                  height: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.green,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.blue,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.cyan,
                  width: 80,
                  height: 80,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.purple,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.pink,
                  width: 80,
                  height: 80,
                ),
                Container(
                  color: Colors.black,
                  width: 80,
                  height: 80,
                )
              ],
            )
          ],
        ));
  }
}
