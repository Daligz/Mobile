import 'package:sqflite/sqflite.dart';
import'package:sql/animal.dart';
import 'package:sqflite/sql.dart';
import 'package:path/path.dart';
import 'package:sql/db.dart';

class DB{
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'animales.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE animales (id INTEGER PRIMARY KEY,nombre TEXT, especie TEXT)",
          );
        }, version: 1);
  }
  static Future<Future<void>>insert(Animal animal) async{
    Database database = await _openDB();
    return database.insert("animales", animal.toMap());
  }
  static Future<Future<void>> delete(Animal animal) async{
    Database database = await _openDB();
    return database.delete("animales", where: "id = ?", whereArgs:[animal.id]);
  }
  static Future<Future<void>> update(Animal animal) async{
    Database database = await _openDB();
    return database.update("animales", animal.toMap(), where: "id = ?", whereArgs:[animal.id]);
  }
  static Future<List<Animal>> animales() async{
    Database database = await _openDB();
    final List<Map<String, dynamic>> animalesMap=await database.query("animales");
    return List.generate(animalesMap.length, (i) => Animal(
      id: animalesMap[i]['id'],
      nombre: animalesMap[i]['nombre'],
      especie: animalesMap[i]['especie'],
    ));
  }
/*
  * comandos basados en sentencias sql
  * rawInsert(sql)
  * rawdelete(sql)
  * rawupdate(sql)
  * rawQuery(sql)
  *
  *
  * static Future<Future<void>>insert(Animal animal) async{
    Database database = await _openDB();
   var resultado=await database.rawInsert("INSERT INTO animales (id,nombre,especie)")
   "values(${animal.id},${animal.nombre},${animal.especie})");
  }
  *
  * */
}
