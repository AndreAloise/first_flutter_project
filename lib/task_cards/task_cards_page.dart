import 'package:first_flutter_project/data/task_cards_inherited.dart';
import 'package:first_flutter_project/form_screen/form_screen_page.dart';
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
      body: _bodyWithOpacity(context),
      floatingActionButton: _floatingButtonList(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  AnimatedOpacity _bodyWithOpacity(BuildContext context) {
    return AnimatedOpacity(
      opacity: shouldApplyOpacity ? 1 : 0,
      duration: const Duration(
        seconds: 3,
      ),
      child: ListView(
          padding: const EdgeInsets.only(top: 8, bottom: 70),
          children: TaskCardsInherited.insideOf(context).taskCardsList),
    );
  }

  Container _floatingButtonList(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _floatingButtonOpacity(),
          _floatingButtonAddTask(context),
        ]));
  }

  FloatingActionButton _floatingButtonOpacity() {
    return FloatingActionButton(
        heroTag: 'opacityButton',
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

  FloatingActionButton _floatingButtonAddTask(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'addTaskButton',
      backgroundColor: Colors.blue,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextNew) => FormScreenPage(taskContext: context)));
      },
      child: const Icon(Icons.add),
    );
  }
}
