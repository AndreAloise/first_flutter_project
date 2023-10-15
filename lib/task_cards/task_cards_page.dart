import 'package:first_flutter_project/task_cards/task_cards_body.dart';
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
      children: [
        TaskCardsBody(
            'Aprendendo Flutter',
            'https://static-00.iconduck.com/assets.00/flutter-icon-1651x2048-ojswpayr.png',
            3),
        TaskCardsBody(
            'Aprendendo Dart',
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/dart-programming-language-icon.png',
            2),
        TaskCardsBody('Aprendendo Git',
            'https://git-scm.com/images/logos/downloads/Git-Icon-1788C.png', 2),
        TaskCardsBody(
            'Aprendendo Java',
            'https://static-00.iconduck.com/assets.00/java-original-icon-756x1024-j3tx11wk.png',
            4),
        TaskCardsBody(
            'Aprendendo C#',
            'https://static-00.iconduck.com/assets.00/c-sharp-c-icon-1822x2048-wuf3ijab.png',
            4),
        TaskCardsBody(
            'Aprendendo Angular',
            'https://static-00.iconduck.com/assets.00/file-type-angular-icon-1907x2048-tobdkjt1.png',
            3),
        TaskCardsBody(
            'Aprendendo Php',
            'https://cdn.icon-icons.com/icons2/2415/PNG/512/php_plain_logo_icon_146397.png',
            5),
        TaskCardsBody('Aprendendo Ruby',
            'https://cdn-icons-png.flaticon.com/512/919/919842.png', 3),
        const SizedBox(
          height: 80,
        )
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
