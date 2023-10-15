import 'package:flutter/material.dart';

class Exercise02 extends StatelessWidget {
  const Exercise02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
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

  ListView _body() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        TaskEx02('Aprendendo Flutter',
            'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png'),
        TaskEx02('Aprendendo Dart',
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dart-programming-language-icon.png'),
        TaskEx02('Aprendendo Git',
            'https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png'),
        TaskEx02('Aprendendo Java',
            'https://static-00.iconduck.com/assets.00/java-original-icon-756x1024-j3tx11wk.png'),
        TaskEx02('Aprendendo C#',
            'https://static-00.iconduck.com/assets.00/c-sharp-c-icon-1822x2048-wuf3ijab.png'),
        TaskEx02('Aprendendo Angular',
            'https://static-00.iconduck.com/assets.00/file-type-angular-icon-1907x2048-tobdkjt1.png'),
        TaskEx02('Aprendendo Php',
            'https://cdn.icon-icons.com/icons2/2415/PNG/512/php_plain_logo_icon_146397.png'),
        TaskEx02('Aprendendo Ruby',
            'https://cdn-icons-png.flaticon.com/512/919/919842.png'),
      ],
    );
  }
}

class TaskEx02 extends StatefulWidget {
  final String taskName;
  final String photoUrl;
  const TaskEx02(this.taskName, this.photoUrl, {Key? key}) : super(key: key);

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
          color: Colors.blue,
          height: 140,
        ),
        Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                      child: Image.network(
                        widget.photoUrl,
                        fit: BoxFit.cover,
                      )),
                  Container(
                      width: 200,
                      child: Text(widget.taskName,
                          style: const TextStyle(
                              fontSize: 24, overflow: TextOverflow.ellipsis))),
                  Container(height: 60, width: 60, child: _levelUpTaskButton())
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.white,
                    value: level / 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nivel: $level',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ])
          ],
        )
      ],
    );
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
