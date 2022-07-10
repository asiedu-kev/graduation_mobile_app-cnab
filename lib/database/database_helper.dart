import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final _databaseName = 'agricef_database.db';
  static final _databaseVersion = 1;
  static final DbHelper _dbHelper = DbHelper._internal();
  static Database? _database;

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // open the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE members(id INTEGER PRIMARY KEY, first_name TEXT,last_name TEXT,'
        ' gender INTEGER, date_of_birth TEXT, birthplace TEXT, profession TEXT, '
        'nationality TEXT, category TEXT,sub_category TEXT, language TEXT,'
        ' department TEXT, municipality TEXT, district TEXT, locality TEXT,'
        'address TEXT, longitude FLOAT, latitude FLOAT, phone TEXT,'
        ' phone_whatsapp TEXT,email TEXT, website TEXT, casual_employees INTEGER,'
        ' permanent_employees INTEGER,annual_sales FLOAT, total_members INTEGER,'
        'denomination TEXT, trade_name TEXT, acronym TEXT, primary_sector TEXT, '
        'primary_activity TEXT, secondary_sector TEXT, secondary_activity TEXT, '
        'creation_date TEXT, registration TEXT, main_service TEXT, secondary_service TEXT,'
        ' occasional_service TEXT, need_help_1 TEXT, need_help_2 TEXT, need_help_3 TEXT, inscription_fee FLOAT, membership_fee FLOAT, date_added TEXT)');
  }
}
