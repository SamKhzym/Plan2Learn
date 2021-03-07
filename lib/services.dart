import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'objects/assignment.dart';
import 'objects/test.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final Future<Database> database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE work(id INTEGER PRIMARY KEY, course TEXT, test BIT, name TEXT, deadline TEXT, studyblocks TEXT, etc INTEGER, priority BIT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertTest(Test test) async {
    final Database db = await database;

    await db.insert(
      'work',
      test.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertAssignment(Assignment assignment) async {
    final Database db = await database;

    await db.insert(
      'work',
      assignment.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Test>> getTests(String _course) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'work',
      columns: ['id','course','test','name','deadline','workblocks','etc','priority'],
      where: '"course" = ?',
      whereArgs: [_course],
    );

    return List.generate(maps.length, (i) {
      return Test(maps[i]['id'],maps[i]['course'],maps[i]['name'],maps[i]['deadline'],maps[i]['workblocks'],maps[i]['etc'],maps[i]['priority'],
        // id: maps[i]['id'],
        // course: maps[i]['course'],
        // name: maps[i]['name'],
        // deadline: maps[i]['deadline'],
        // workblocks: maps[i]['workblocks'],
        // etc: maps[i]['etc'],
        // priority: maps[i]['priority'],
      );
    });
  }

  Future<List<Assignment>> getAssignments(String _course) async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query(
      'work',
      columns: ['id','course','test','name','deadline','workblocks','etc','priority'],
      where: '"course" = ?',
      whereArgs: [_course],
    );

    return List.generate(maps.length, (i) {
      return Assignment(maps[i]['id'],maps[i]['course'],maps[i]['name'],maps[i]['deadline'],maps[i]['workblocks'],maps[i]['etc'],maps[i]['priority'],
        // id: maps[i]['id'],
        // course: maps[i]['course'],
        // name: maps[i]['name'],
        // deadline: maps[i]['deadline'],
        // workblocks: maps[i]['workblocks'],
        // etc: maps[i]['etc'],
        // priority: maps[i]['priority'],
      );
    });
  }
}