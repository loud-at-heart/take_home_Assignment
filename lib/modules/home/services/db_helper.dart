import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:take_home_assignment/models/album_model.dart';

// Database Helper
class DatabaseHelper {

  DatabaseHelper._init();
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('albums.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE albums(
        id INTEGER PRIMARY KEY,
        title TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE photos(
        id INTEGER PRIMARY KEY,
        albumId INTEGER,
        title TEXT,
        url TEXT,
        thumbnailUrl TEXT
      )
    ''');
  }

  // CRUD operations for Albums
  Future<void> insertAlbum(Album album) async {
    final db = await database;
    await db.insert('albums', album.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Album>> getAlbums() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('albums');
    return List.generate(maps.length, (i) {
      return Album(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  // CRUD operations for Photos
  Future<void> insertPhoto(Photo photo) async {
    final db = await database;
    await db.insert('photos', photo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'photos',
      where: 'albumId = ?',
      whereArgs: [albumId],
    );
    return List.generate(maps.length, (i) {
      return Photo(
        id: maps[i]['id'],
        albumId: maps[i]['albumId'],
        title: maps[i]['title'],
        url: maps[i]['url'],
        thumbnailUrl: maps[i]['thumbnailUrl'],
      );
    });
  }
}