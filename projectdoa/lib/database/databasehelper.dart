import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'ramadhan.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        await db.execute('''
        CREATE TABLE amalan(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          category TEXT
        )
        ''');

        // Dzikir
        await db.insert('amalan', {
          'title': 'Dzikir Pagi',
          'category': 'Dzikir'
        });

        await db.insert('amalan', {
          'title': 'Dzikir Petang',
          'category': 'Dzikir'
        });

        await db.insert('amalan', {
          'title': 'Dzikir Setelah Shalat',
          'category': 'Dzikir'
        });

        // Doa
        await db.insert('amalan', {
          'title': 'Doa Sebelum Tidur',
          'category': 'Doa'
        });

        await db.insert('amalan', {
          'title': 'Doa Bangun Tidur',
          'category': 'Doa'
        });

        await db.insert('amalan', {
          'title': 'Doa Masuk Masjid',
          'category': 'Doa'
        });

        await db.insert('amalan', {
          'title': 'Doa Keluar Rumah',
          'category': 'Doa'
        });

        // Sunnah
        await db.insert('amalan', {
          'title': 'Shalat Dhuha',
          'category': 'Sunnah'
        });

        await db.insert('amalan', {
          'title': 'Shalat Tahajud',
          'category': 'Sunnah'
        });

        await db.insert('amalan', {
          'title': 'Puasa Senin Kamis',
          'category': 'Sunnah'
        });

        await db.insert('amalan', {
          'title': 'Membaca Al-Quran',
          'category': 'Sunnah'
        });

        await db.insert('amalan', {
          'title': 'Sedekah Harian',
          'category': 'Sunnah'
        });

      },
    );
  }

  static Future<List<Map<String, dynamic>>> getAmalan() async {
    final db = await database;
    return db.query('amalan');
  }
}