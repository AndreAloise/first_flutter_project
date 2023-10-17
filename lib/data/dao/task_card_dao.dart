import 'package:first_flutter_project/data/database.dart';
import 'package:first_flutter_project/task_cards/task_card.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class TaskCardDao {
  static const String tableSql =
      'CREATE TABLE $_tableName($_name TEXT, $_difficulty INTEGER, $_image TEXT, $_level INTEGER, $_mastery INTEGER)';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _level = 'level';
  static const String _mastery = 'mastery_level';

  /* alterTableAddColumnLevel() async {
    final Database dataBase = await getDatabase();
    await dataBase.execute("ALTER TABLE $_tableName ADD "
        "COLUMN $_level INTEGER;");
  }

  alterTableAddColumnMastery() async {
    final Database dataBase = await getDatabase();
    await dataBase.execute("ALTER TABLE $_tableName ADD "
        "COLUMN $_mastery INTEGER;");
  } */

  ///If doesn't save or update, try to change code to return those methods instead of just invoking
  saveOrUpdate(TaskCard taskCard) async {
    debugPrint('INIT - TaskCardDao.saveOrUpdate');

    final Database dataBase = await getDatabase();
    List<TaskCard> existsTask = await findTasksByName(taskCard.taskName);
    Map<String, dynamic> taskMap = _toMap(taskCard);

    if (existsTask.isEmpty) {
      _saveTask(taskMap, dataBase);
    } else {
      _updateTask(taskCard.taskName, taskMap, dataBase);
    }

    debugPrint('END - TaskCardDao.saveOrUpdate');
  }

  _saveTask(Map<String, dynamic> taskMap, Database dataBase) async {
    debugPrint('INIT - TaskCardDao.saveTask');

    await dataBase.insert(_tableName, taskMap);

    debugPrint('END - TaskCardDao.saveTask');
  }

  _updateTask(
      String taskName, Map<String, dynamic> taskMap, Database dataBase) async {
    debugPrint('INIT - TaskCardDao._updateTask');

    await dataBase.update(_tableName, taskMap,
        where: '$_name = ?', whereArgs: [taskName]);

    debugPrint('END - TaskCardDao._updateTask');
  }

  Map<String, dynamic> _toMap(TaskCard taskCard) {
    debugPrint('Converting TaskCard into Map');

    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = taskCard.taskName;
    taskMap[_image] = taskCard.photoPath;
    taskMap[_difficulty] = taskCard.difficulty;
    taskMap[_level] = taskCard.level;
    taskMap[_mastery] = taskCard.masteryLevel;

    debugPrint('Converted Map: $taskMap');
    return taskMap;
  }

  Future<List<TaskCard>> findAll() async {
    debugPrint('INIT - TaskCardDao.findAll');

    final Database dataBase = await getDatabase();
    final List<Map<String, dynamic>> result = await dataBase.query(_tableName);
    debugPrint('Found the following data from Database: $result');

    List<TaskCard> list = _toList(result);
    debugPrint('END - TaskCardDao.findAll');
    return list;
  }

  List<TaskCard> _toList(List<Map<String, dynamic>> mappedTaskList) {
    debugPrint('Converting Map into List');
    final List<TaskCard> tasks = [];

    for (Map<String, dynamic> mappedTask in mappedTaskList) {
      final TaskCard taskCard = TaskCard(mappedTask[_name], mappedTask[_image],
          mappedTask[_difficulty], mappedTask[_level], mappedTask[_mastery]);
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

  ///If doesn't delete, try to return instead of just invoking the database.delete
  deleteTasksByName(String taskName) async {
    debugPrint('INIT - TaskCardDao.deleteTasksByName');

    final Database dataBase = await getDatabase();
    debugPrint('Deleting Task: $taskName');
    dataBase.delete(_tableName, where: '$_name = ?', whereArgs: [taskName]);

    debugPrint('END - TaskCardDao.deleteTasksByName');
  }

  Future<int> getLevelByTaskName(String taskName) async {
    debugPrint('INIT - TaskCardDao.getLevelByTaskName');

    List<TaskCard> list = await findTasksByName(taskName);
    int level = list[0].level;

    debugPrint('END - TaskCardDao.getLevelByTaskName');

    return level;
  }

  Future<int> getMasteryByTaskName(String taskName) async {
    debugPrint('INIT - TaskCardDao.getLevelByTaskName');

    List<TaskCard> list = await findTasksByName(taskName);
    int mastery = list[0].masteryLevel;

    debugPrint('END - TaskCardDao.getLevelByTaskName');

    return mastery;
  }
}
