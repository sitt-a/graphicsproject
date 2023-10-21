import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../domain/Complaint_model/report.dart';
import '../../domain/Announcement_model/announcement.dart';
import '../../domain/User_model/user.dart';

class ComplaintDb {
  late Database database;

  // initializing the database
  Future<void> initDB() async {
    String databasesPath = await getDatabasesPath();
    database = await openDatabase(
      join(databasesPath, 'complaint_reporter.db'),
      onCreate: _createDb,
      version: 1,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE IF NOT EXISTS user (
          name TEXT, 
          password TEXT,
          role TEXT
        )''',
    );

    await db.execute(
      '''CREATE TABLE IF NOT EXISTS complaint (
          title TEXT, 
          description TEXT,
          status TEXT, 
          reporter TEXT
        )''',
    );
  }

  // creating user table
  Future<void> insertUser(User user) async {
    final db = database;
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // creating complaint table
  Future<void> insertComplaint(Report complaint) async {
    final db = database;
    await db.insert(
      'complaint',
      complaint.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // user CRUD operations
  Future<List<User>> getUsers() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (i) {
      return User(
        userId: maps[i]['userId'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        password: maps[i]['password'],
        role: maps[i]['role'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    final db = database;
    await db.update(
      'user',
      user.toMap(),
      where: "password = ?",
      whereArgs: [user.password],
    );
  }

  Future<void> deleteUser(int password) async {
    final db = database;
    await db.delete(
      'user',
      where: "password = ?",
      whereArgs: [password],
    );
  }

  // complaint CRUD operations
  Future<List<Report>> getComplaints() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('complaint');
    return List.generate(maps.length, (i) {
      return Report(
        university: maps[i]['university'],
        complainTo: maps[i]['complaintTo'],
        complaint_reporter: maps[i]['reporter'],
        description: maps[i]['description'],
        complaintId: maps[i]['_id'],
        title: maps[i]['title'],
        status: maps[i]['status'],
      );
    });
  }

  Future<void> updateComplaint(Report complaint) async {
    final db = database;
    await db.update(
      'complaint',
      complaint.toMap(),
      where: "_id = ?",
      whereArgs: [complaint.complaintId],
    );
  }

  Future<void> deleteComplaint(int id) async {
    final db = database;
    await db.delete(
      'complaint',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}

class AnnouncementDb {
  late Database database;

  // initializing the database
  Future<void> initDB() async {
    String databasesPath = await getDatabasesPath();
    database = await openDatabase(
      join(databasesPath, 'announcement.db'),
      onCreate: _createDb,
      version: 1,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE IF NOT EXISTS user (
          name TEXT, 
          password TEXT,
          role TEXT
        )''',
    );

    await db.execute(
      '''CREATE TABLE IF NOT EXISTS announcement (
          title TEXT, 
          body TEXT,
          author TEXT,
          status TEXT, 
          date DATETIME
        )''',
    );
  }

  // creating manager table
  Future<void> insertUser(User user) async {
    final db = database;
    await db.insert(
      'manager',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // creating announcement table
  Future<void> insertAnnouncement(Announcement announcement) async {
    final db = database;
    await db.insert(
      'announcement',
      announcement.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // user CRUD operations
  Future<List<User>> getUsers() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (i) {
      return User(
        userId: maps[i]['userId'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        password: maps[i]['password'],
        role: maps[i]['role'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    final db = database;
    await db.update(
      'user',
      user.toMap(),
      where: "password = ?",
      whereArgs: [user.password],
    );
  }

  Future<void> deleteUser(int password) async {
    final db = database;
    await db.delete(
      'user',
      where: "password = ?",
      whereArgs: [password],
    );
  }

  // announcement CRUD operations
  Future<List<Announcement>> getAnnouncements() async {
    final db = database;
    final List<Map<String, dynamic>> maps = await db.query('announcement');
    return List.generate(maps.length, (i) {
      return Announcement(
        author: maps[i]['author'],
        body: maps[i]['body'],
        announcementId: maps[i]['_id'],
        title: maps[i]['title'],
      );
    });
  }

  Future<void> updateAnnouncement(Announcement announcement) async {
    final db = database;
    await db.update(
      'announcement',
      announcement.toMap(),
      where: "_id = ?",
      whereArgs: [announcement.announcementId],
    );
  }

  Future<void> deleteAnnouncement(int id) async {
    final db = database;
    await db.delete(
      'announcement',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
