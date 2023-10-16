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
      floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _floatingButtonOpacity(),
            _floatingButtonOpacity(),
          ])),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            'Aprendendo Flutter', 'assets/images/flutter-icon.png', 3),
        TaskCardsBody('Aprendendo Dart', 'assets/images/dart-icon.png', 2),
        TaskCardsBody('Aprendendo Git', 'assets/images/git-icon.png', 2),
        TaskCardsBody('Aprendendo Java', 'assets/images/java-icon.png', 4),
        TaskCardsBody('Aprendendo C#', 'assets/images/c-sharp-icon.png', 4),
        TaskCardsBody(
            'Aprendendo Angular', 'assets/images/angular-icon.png', 3),
        TaskCardsBody('Aprendendo Php', 'assets/images/php-icon.png', 5),
        TaskCardsBody('Aprendendo Ruby', 'assets/images/ruby-icon.png', 3),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }

  FloatingActionButton _floatingButtonOpacity() {
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
