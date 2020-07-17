import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/database_name.dart';

class DatabaseService {
  Database _database;

  DatabaseService() {
    init();
  }

  void init() async {
    _database = await _initialDb();
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initialDb();
    return _database;
  }

  // Open Assets Database
  Future<Database> _initialDb() async {
    var dbPath = await getDatabasesPath();
    var path = join(dbPath, databaseName);

    var exists = await databaseExists(path);

    if (!exists) {
      print('creating new copy from asset');

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join(assetsFolder, databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print('opening existing database');
    }
    // Read ONLY for dictionary
    return await openDatabase(path);
  }
}
