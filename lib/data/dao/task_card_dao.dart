import 'package:first_flutter_project/data/database.dart';
import 'package:first_flutter_project/task_cards/task_card.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TaskCardDao {
  static const String tableSql =
      'CREATE TABLE $_tableName($_name TEXT, $_difficulty INTEGER, $_image TEXT)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  saveTask(TaskCard taskCard) async {}

  Future<List<TaskCard>> findAll() async {
    debugPrint('INIT - TaskCardDao.findAll');

    final Database dataBase = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBase.query(_tableName);
    debugPrint('Found the following data form Database: $result');

    List<TaskCard> list = _toList(result);
    debugPrint('END - TaskCardDao.findAll');
    return list;
  }

  List<TaskCard> _toList(List<Map<String, dynamic>> mappedTaskList) {
    debugPrint('Converting Map into List');
    final List<TaskCard> tasks = [];

    for (Map<String, dynamic> mappedTask in mappedTaskList) {
      final TaskCard taskCard = TaskCard(
          mappedTask[_name], mappedTask[_image], mappedTask[_difficulty]);
      tasks.add(taskCard);
    }

    debugPrint('Converted Task List: $tasks');
    return tasks;
  }

  Future<List<TaskCard>> findTasksByName(String taskName) async {
    debugPrint('INIT - TaskCardDao.findTasksByName');

    final Database dataBase = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBase
        .query(_tableName, where: '$_name = ?', whereArgs: [taskName]);

    List<TaskCard> list = _toList(result);
    debugPrint('Found the following data form Database: $result');

    debugPrint('END - TaskCardDao.findTasksByName');
    return list;
  }

  deleteTasksByName(String taskName) async {}
}
