import 'package:first_flutter_project/task_cards/task_card.dart';

class TaskCardDao {
  static const String tableSql =
      'CREATE TABLE $_tableName($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  saveTask(TaskCard taskCard) async {}

  Future<List<TaskCard>> findAll() async {
    return [TaskCard('teste', 'photoPath', 0)];
  }

  Future<List<TaskCard>> findTasksByName(String taskName) async {
    return [TaskCard('teste', 'photoPath', 0)];
  }

  deleteTasksByName(String taskName) async {}
}
