import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo.dart';

class DbHelper {
  static Future<Database> _getDB() async {
    final path = join(await getDatabasesPath(), 'todos.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            prioritaire INTEGER,
            isDone INTEGER
          )
        ''');
      },
    );
  }

  static Future<int> insert(Todo todo) async {
    final db = await _getDB();
    return await db.insert('todos', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Todo>> getAll() async {
    final db = await _getDB();
    final maps = await db.query('todos');
    return List.generate(maps.length, (i) => Todo.fromMap(maps[i]));
  }

  static Future<int> update(Todo todo) async {
    final db = await _getDB();
    return await db.update('todos', todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
  }

  static Future<void> delete(int id) async {
    final db = await _getDB();
    await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}