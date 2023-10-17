import 'package:first_flutter_project/data/dao/task_card_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task_cards.db');
  String taskCardTable = TaskCardDao.tableSql;
  Future<Database> dataBase = openDatabase(path, onCreate: (db, version) {
    db.execute(taskCardTable);
  }, version: 1);

  return dataBase;
}
