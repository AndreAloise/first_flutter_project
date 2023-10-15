import 'package:first_flutter_project/task_cards/task_cards_difficulty.dart';
import 'package:flutter/material.dart';

class TaskCardsPage extends StatefulWidget {
  const TaskCardsPage({Key? key}) : super(key: key);

  @override
  State<TaskCardsPage> createState() => _TaskCardsPageState();
}

class _TaskCardsPageState extends State<TaskCardsPage> {
  bool shouldApplyOpacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyWithOpacity(),
      floatingActionButton: _floatingButton(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: Image.network(
        'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
        fit: BoxFit.cover,
      ),
      title: const Text('Tarefas'),
    );
  }

  AnimatedOpacity _bodyWithOpacity() {
    return AnimatedOpacity(
      opacity: shouldApplyOpacity ? 1 : 0,
      duration: const Duration(
        seconds: 3,
      ),
      child: _body(),
    );
  }

  ListView _body() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        TaskEx02(
            'Aprendendo Flutter',
            'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png',
            3),
        TaskEx02(
            'Aprendendo Dart',
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dart-programming-language-icon.png',
            2),
        TaskEx02('Aprendendo Git',
            'https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png', 2),
        TaskEx02(
            'Aprendendo Java',
            'https://static-00.iconduck.com/assets.00/java-original-icon-756x1024-j3tx11wk.png',
            4),
        TaskEx02(
            'Aprendendo C#',
            'https://static-00.iconduck.com/assets.00/c-sharp-c-icon-1822x2048-wuf3ijab.png',
            4),
        TaskEx02(
            'Aprendendo Angular',
            'https://static-00.iconduck.com/assets.00/file-type-angular-icon-1907x2048-tobdkjt1.png',
            3),
        TaskEx02(
            'Aprendendo Php',
            'https://cdn.icon-icons.com/icons2/2415/PNG/512/php_plain_logo_icon_146397.png',
            5),
        TaskEx02('Aprendendo Ruby',
            'https://cdn-icons-png.flaticon.com/512/919/919842.png', 3),
      ],
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 57, 29, 100),
        onPressed: () {
          setState(() {
            shouldApplyOpacity = !shouldApplyOpacity;
          });
        },
        child: Icon(
          color: Colors.white,
          shouldApplyOpacity ? Icons.visibility_off : Icons.visibility,
        ));
  }
}

class TaskEx02 extends StatefulWidget {
  final String taskName;
  final String photoUrl;
  final int difficulty;

  const TaskEx02(this.taskName, this.photoUrl, this.difficulty, {Key? key})
      : super(key: key);

  @override
  State<TaskEx02> createState() => _TaskEx02State();
}

class _TaskEx02State extends State<TaskEx02> {
  int level = 0;

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
            value:
                (widget.difficulty > 0) ? (level / widget.difficulty) / 10 : 1,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Level: $level',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ]);
  }

  ElevatedButton _levelUpTaskButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          level++;
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
