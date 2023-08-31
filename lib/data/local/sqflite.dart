import 'package:homeworks/data/model/universal_data.dart';
import 'package:homeworks/data/model/user_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
      _database = await _initDB("users.db");
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
    CREATE TABLE ${UserModelFields.table} (
    ${UserModelFields.id} $idType,
    ${UserModelFields.firstname} $textType,
    ${UserModelFields.lastname} $textType,
    ${UserModelFields.age} $textType,
    ${UserModelFields.gender} $textType,
    ${UserModelFields.job} $textType
    )
    ''');
  }

  static Future<UserModel> insertUser(UserModel userModel) async {
    final db = await getInstance.database;
    final int id = await db.insert(UserModelFields.table, userModel.toJson());
    return userModel.copyWith(id: id);
  }

  static Future<List<UserModel>> getAllUsers() async {
    List<UserModel> allUsers = [];
    final db = await getInstance.database;
    allUsers = (await db.query(UserModelFields.table))
        .map((e) => UserModel.fromJson(e))
        .toList();

    return allUsers;
  }

  static Future<UniversalData> deleteUser(int id) async {
    final db = await getInstance.database;
    try {
      db.delete(
        UserModelFields.table,
        where: "id = ?",
        whereArgs: [id],
      );
      return UniversalData(data: 'User deleted');
    } catch (error) {
     return UniversalData(error: 'User deleting in error $error');
    }
  }


  static Future<UniversalData> updateUser({required int id, required UserModel userModel}) async {
    final db = await getInstance.database;
    try{
      db.update(
        UserModelFields.table,
        {UserModelFields.firstname: userModel.firstname},
        where: "${UserModelFields.id} = ?",
        whereArgs: [id],
      );
      db.update(
        UserModelFields.table,
        {UserModelFields.lastname: userModel.lastname},
        where: "${UserModelFields.id} = ?",
        whereArgs: [id],
      );
      db.update(
        UserModelFields.table,
        {UserModelFields.age: userModel.age},
        where: "${UserModelFields.id} = ?",
        whereArgs: [id],
      );
      return UniversalData(data: 'User updated successfully');
    }catch(e){
      return UniversalData(error: 'Updating in error $e');
    }
  }
}
