import 'package:emdictionary/services/database_service.dart';
import 'package:sqflite/sqflite.dart';

import '../../constants/database_name.dart';
import '../../locator.dart';
import '../../models/definition.dart';

class DictionaryRepository {
  Database database;

  DictionaryRepository() {
    init();
  }

  void init() async {
    var databaseService = locator<DatabaseService>();
    database = await databaseService.database;
  }

  Future<List<Definition>> searchDefinition({String text}) async {
    final rows = await database.query(dictionaryTable,
        where: '$dictionaryWord LIKE ?',
        whereArgs: [text + '%'],
        limit: limitDictionary,
        orderBy: 'LENGTH($dictionaryWord)');

    return rows.map((e) => Definition.fromMap(e)).toList();
  }
}
