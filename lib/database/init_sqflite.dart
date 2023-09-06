import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    // if (_db == null) {
    //   _db = await initailDb();
    // } else {
    //   return _db;
    // }
    //return _db;
    return _db ?? (_db = await initailDb());
  }

  initailDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "todo.db");
    Database myDB = await openDatabase(path, onCreate: _onCreate, version: 1);
    return myDB;
  }

  _onCreate(Database db, int version) async {
    await db.execute(''' 
    CREATE TABLE "todos1" ('id' INTEGER PRIMARY KEY ,
                        'title' TEXT  NOT NULL ,
                        'subtitle' TEXT NOT NULL,
                        'time' DATETIME
                        )
    ''');
    print("created ==========  Db");
  }
}
