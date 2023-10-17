import 'package:first_flutter_project/task_cards/task_card.dart';
import 'package:flutter/material.dart';

class TaskCardsInherited extends InheritedWidget {
  TaskCardsInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<TaskCard> taskCardsList = [
    TaskCard('Aprendendo Flutter', 'assets/images/flutter-icon.png', 3, 0, 0),
    TaskCard('Aprendendo Dart', 'assets/images/dart-icon.png', 2, 0, 0),
    TaskCard('Aprendendo Git', 'assets/images/git-icon.png', 2, 0, 0),
    TaskCard('Aprendendo Java', 'assets/images/java-icon.png', 4, 0, 0),
    TaskCard('Aprendendo C#', 'assets/images/c-sharp-icon.png', 4, 0, 0),
    TaskCard('Aprendendo Angular', 'assets/images/angular-icon.png', 3, 0, 0),
    TaskCard('Aprendendo Php', 'assets/images/php-icon.png', 5, 0, 0),
    TaskCard('Aprendendo Ruby', 'assets/images/ruby-icon.png', 3, 0, 0),
  ];

  void addNewTask(String taskName, String photoPath, int difficulty) {
    taskCardsList.add(TaskCard(taskName, photoPath, difficulty, 0, 0));
  }

  static TaskCardsInherited insideOf(BuildContext context) {
    final TaskCardsInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskCardsInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskCardsInherited oldWidget) {
    return oldWidget.taskCardsList.length != taskCardsList.length;
  }
}
