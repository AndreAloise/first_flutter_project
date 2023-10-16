import 'package:first_flutter_project/task_cards/task_card.dart';
import 'package:flutter/material.dart';

class TaskCardsInherited extends InheritedWidget {
  TaskCardsInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<TaskCard> taskCardsList = [
    TaskCard('Aprendendo Flutter', 'assets/images/flutter-icon.png', 3),
    TaskCard('Aprendendo Dart', 'assets/images/dart-icon.png', 2),
    TaskCard('Aprendendo Git', 'assets/images/git-icon.png', 2),
    TaskCard('Aprendendo Java', 'assets/images/java-icon.png', 4),
    TaskCard('Aprendendo C#', 'assets/images/c-sharp-icon.png', 4),
    TaskCard('Aprendendo Angular', 'assets/images/angular-icon.png', 3),
    TaskCard('Aprendendo Php', 'assets/images/php-icon.png', 5),
    TaskCard('Aprendendo Ruby', 'assets/images/ruby-icon.png', 3),
  ];

  void addNewTask(String taskName, String photoPath, int difficulty) {
    TaskCard newCard = _createNewTask(taskName, photoPath, difficulty);
    taskCardsList.add(newCard);
  }

  TaskCard _createNewTask(String taskName, String photoPath, int difficulty) {
    TaskCard newTask = TaskCard(taskName, photoPath, difficulty);
    return newTask;
  }

  static TaskCardsInherited of(BuildContext context) {
    final TaskCardsInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskCardsInherited>();
    return result!;
  }

  @override
  bool updateShouldNotify(TaskCardsInherited oldWidget) {
    return oldWidget.taskCardsList.length != taskCardsList.length;
  }
}
