import 'package:first_flutter_project/task_cards/task_cards_difficulty.dart';
import 'package:flutter/material.dart';

class TaskCardsBody extends StatefulWidget {
  final String taskName;
  final String photoUrl;
  final int difficulty;
  int level = 0;

  TaskCardsBody(this.taskName, this.photoUrl, this.difficulty, {Key? key})
      : super(key: key);

  @override
  State<TaskCardsBody> createState() => _TaskCardsBodyState();
}

class _TaskCardsBodyState extends State<TaskCardsBody> {
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
        Container(
          color: null,
          height: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: Colors.blue),
        ),
        Column(
          children: [
            _taskCardContainer(),
            _levelProgressRow(),
          ],
        )
      ],
    );
  }

  Container _taskCardContainer() {
    return Container(
      color: null,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              color: null,
              width: 72,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.black26),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    widget.photoUrl,
                    fit: BoxFit.cover,
                  ))),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  child: Text(widget.taskName,
                      style: const TextStyle(
                          fontSize: 24, overflow: TextOverflow.ellipsis))),
              TaskCardsDifficulty(widget.difficulty),
            ],
          ),
          Container(height: 60, width: 60, child: _levelUpTaskButton())
        ],
      ),
    );
  }

  Row _levelProgressRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          child: LinearProgressIndicator(
            color: Colors.white,
            value: (widget.difficulty > 0)
                ? (widget.level / widget.difficulty) / 10
                : 1,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Level: ${widget.level}',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ]);
  }

  ElevatedButton _levelUpTaskButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.level++;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Icon(Icons.arrow_drop_up),
          Text(
            "Lvl Up",
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
