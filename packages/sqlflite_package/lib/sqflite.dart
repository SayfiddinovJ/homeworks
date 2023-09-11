import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();
  static String dataPath = '';
  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("students.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    dataPath = path;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";

    await db.execute('''
    CREATE TABLE ${StudentModelFields.dbTable} (
    ${StudentModelFields.id} $idType,
    ${StudentModelFields.name} $textType,
    ${StudentModelFields.lastname} $textType,
    ${StudentModelFields.age} $textType
    )
    ''');
  }

  static Future<StudentModel> insertStudent(StudentModel studentModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(StudentModelFields.dbTable, studentModel.toJson());
    return studentModel.copyWith(id: id);
  }

  static Future<List<StudentModel>> getAllStudents() async {
    List<StudentModel> allMessages = [];
    final db = await getInstance.database;
    allMessages = (await db.query(StudentModelFields.dbTable))
        .map((e) => StudentModel.fromJson(e))
        .toList();

    return allMessages;
  }

  static updateStudent({required int id, required StudentModel studentModel}) async {
    final db = await getInstance.database;
    db.update(
      StudentModelFields.name,
      {StudentModelFields.name: studentModel.name},
      where: "${StudentModelFields.id} = ?",
      whereArgs: [id],
    );
    db.update(
      StudentModelFields.lastname,
      {StudentModelFields.lastname: studentModel.lastname},
      where: "${StudentModelFields.id} = ?",
      whereArgs: [id],
    );
    db.update(
      StudentModelFields.age,
      {StudentModelFields.age: studentModel.age},
      where: "${StudentModelFields.id} = ?",
      whereArgs: [id],
    );
    print('Updated');
  }

  static deleteStudent(int id) async {
    final db = await getInstance.database;
    db.delete(
      StudentModelFields.dbTable,
      where: "${StudentModelFields.id} = ?",
      whereArgs: [id],
    );
  }
}