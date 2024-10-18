import 'package:authentication/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  Future<Database> openMyDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), 'myAuthApp.db'),
        version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, email TEXT, password  Text)',
      );
    });
  }

  //to insert a new user into the table user
  Future<void> insertUser(String email, String password) async {
    final db = await openMyDatabase();
    db.insert(
        'user',
        {
          'email': email,
          'password': password,
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("user added");
  }

  //get the user by email
  Future<User> getUserByEmail(String email) async {
    final db = await openMyDatabase();
    dynamic result = db.query(
      'user',
      where: 'email=?',
      whereArgs: [email],
    );
    if (result != "") {
      return User(email: result[0]['email'], password: result[0]['password']);
    } else {
      return User(email: "", password: "");
    }
  }
}
