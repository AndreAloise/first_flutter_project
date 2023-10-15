import 'package:flutter/material.dart';

class TaskCardsDifficulty extends StatelessWidget {
  final int difficultyLevel;
  const TaskCardsDifficulty(this.difficultyLevel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getStarIcon(1),
        _getStarIcon(2),
        _getStarIcon(3),
        _getStarIcon(4),
        _getStarIcon(5)
      ],
    );
  }

  Icon _getStarIcon(int baseDifficulty) {
    return Icon(Icons.star,
        size: 15, color: _getColorByDifficulty(baseDifficulty));
  }

  Color? _getColorByDifficulty(int baseDifficulty) {
    return (difficultyLevel >= baseDifficulty) ? Colors.blue : Colors.blue[100];
  }
}
