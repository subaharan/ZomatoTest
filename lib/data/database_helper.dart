import 'dart:io';

import 'package:path/path.dart';



class DatabaseHelper {
  static final _databaseName = "Islamicly.db";
  static final _databaseVersion = 1;

  static final table = 'login';

  static final columnId = 'column_id';
  static final Name = 'Name';
  static final EmailId = 'EmailId';
  static final UserImage = 'UserImage';
  static final Token = 'Token';
  static final Id = 'Id';
  static final LoggedIn = 'LoggedIn';
  static final RegistrationID = 'RegistrationID';
  static final CountryCode = 'CountryCode';
  static final CountryName = 'CountryName';
  static final LastLogin = 'LastLogin';
  static final RegisteredDate = 'RegisteredDate';
  static final Mobile = 'Mobile';
  static final IsAdmin = 'IsAdmin';

  // make this a singleton class
  DatabaseHelper._privateConstructor();

/*  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $Name TEXT NOT NULL,
            $EmailId TEXT NOT NULL,
            $UserImage TEXT NOT NULL,
            $Token TEXT NOT NULL,
            $Id INTEGER NOT NULL,
            $LoggedIn BOOLEAN,
            $RegistrationID TEXT,
            $CountryCode TEXT,
            $CountryName TEXT,
            $LastLogin TEXT,
            $RegisteredDate TEXT,
            $Mobile TEXT,
            $IsAdmin BOOLEAN
            
          )
          ''');
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<Map<String, dynamic>> queryLastRow() async {
    Database db = await instance.database;
    // get single row
  *//*  List<String> columnsToSelect = [
      DatabaseHelper.columnId,
      DatabaseHelper.Name,
      DatabaseHelper.EmailId,
      DatabaseHelper.UserImage,
      DatabaseHelper.EmailId,
      DatabaseHelper.Token,
      DatabaseHelper.Id,
      DatabaseHelper.LoggedIn,
    ];*//*
//    int rowId = 0;
    String whereString = '${DatabaseHelper.columnId} = ?';
    String orderByString = '${DatabaseHelper.Id} DESC ';
//    List<dynamic> whereArguments = [rowId];
//    List<Map> list = await db.rawQuery('SELECT TOP(1) * FROM $table ORDER BY $columnId DESC');
    List<Map> result = await db.query(DatabaseHelper.table);
//    return await db.query(table);
if(result.length>0) {
  return result.last;
}else{
  return null;
}
  }

  *//*_query() async {

    // get a reference to the database
    Database db = await DatabaseHelper.instance.database;

    // get single row
    List<String> columnsToSelect = [
      DatabaseHelper.columnId,
      DatabaseHelper.columnName,
      DatabaseHelper.columnAge,
    ];
    String whereString = '${DatabaseHelper.columnId} = ?';
    int rowId = 1;
    List<dynamic> whereArguments = [rowId];
    List<Map> result = await db.query(
        DatabaseHelper.table,
        columns: columnsToSelect,
        where: whereString,
        whereArgs: whereArguments);

    // print the results
    result.forEach((row) => print(row));
    // {_id: 1, name: Bob, age: 23}
  }*//*

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> updateLogout() async {
    Database db = await instance.database;

    List<Map> result = await db.query(DatabaseHelper.table);
    Map<String, dynamic> row1 = result.last;
    Map<String, dynamic> row = {

      DatabaseHelper.LoggedIn: 0

    };
    int id = row1[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }*/
}
