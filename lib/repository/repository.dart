import 'package:sqflite/sqflite.dart';
import 'package:todo/database/init_sqflite.dart';

class Repository {
  SqlDb sqlDb = SqlDb();

  //fetch Data
  Future<List<Map>> getTodos(String sql) async {
    Database? db = await sqlDb.db;

    List<Map<String, dynamic>> response = await db!.rawQuery(sql);
    return response;
  }

  //Craete Data
  Future<int> createTodo(String sql) async {
    Database? db = await sqlDb.db;

    int response = await db!.rawInsert(sql);
    return response;
  }

  //Update Data
  Future<int> updateTodo(String sql) async {
    Database? db = await sqlDb.db;

    int response = await db!.rawUpdate(sql);
    return response;
  }

  //Delete Data
  Future<int> deleteTodo(String sql) async {
    Database? db = await sqlDb.db;

    int response = await db!.rawDelete(sql);
    return response;
  }

  //get todo by id
  Future getTodobyid(List<Map> list, id) async {
    for (Map m in list) {
      if (m['id'] == id) {
        return m;
      }
    }
  }
}
