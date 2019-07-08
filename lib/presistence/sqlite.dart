import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

///Model Dog
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  // Convert a Dog into a Map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}

class DBHelper {
  Future<Database> database;

  void initConnection() async {
    database = openDatabase(
      // Set path of Database
      join(await getDatabasesPath(), 'doggies_database.db'),

      //When the database is first created, create a table to store dogs
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
            "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
      },
      //set the version
      version: 1,
    );

    await insertDog(Dog(id: 2, name: 'ROCKY', age: 18));
  }

  //This method insert a spacefect dog
  Future<void> insertDog(Dog dog) async {
    final Database db = await database;
    await db.insert(
      "dogs",
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace, // if dog exsists replace it
    );

    print('Sucessfully insert ${dog.name}');

// A method that retrives all dogs
    Future<List<Dog>> dogs() async {
      //Get Database refrence
      final Database db = await database;

      //Query the table for all The dogs.
      final List<Map<String, dynamic>> maps = await db.query("dogs");

      // Convert the  map list into List<Dog>
      return List.generate(
        maps.length,
        (i) {
          return Dog(
            id: maps[i]['id'],
            name: maps[i]['name'],
            age: maps[i]['age'],
          );
        },
      );
    }

    print(dogs().toString());
  }
}

class SQliteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'SQlite';

    DBHelper().initConnection();

    getList() {
      // String a = DBHelper().dogs().toString();

      return "Hi";
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Center(
          child: Text(
            getList().toString(),
          ),
        ),
      ),
    );
  }
}
