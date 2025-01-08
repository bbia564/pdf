
import 'package:get/get.dart';
import 'package:my_file/db_file/file_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBFile extends GetxService {
  late Database dbBase;

  Future<DBFile> init() async {
    await createFileDB();
    return this;
  }

  createFileDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'file.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createFileTable(db);
        });
  }

  createFileTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS file (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, filePath TEXT)');
  }

  insertFile(FileEntity entity) async {
    final id = await dbBase.insert('file', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'filePath': entity.filePath,
    });
    return id;
  }

  deleteFiles(List<FileEntity> entities) async {
    for (var entity in entities) {
      await dbBase.delete('file', where: 'id = ?', whereArgs: [entity.id]);
    }
  }

  cleanFileData() async {
    await dbBase.delete('file');
  }

  Future<List<FileEntity>> getFileAllData() async {
    var result = await dbBase.query('file', orderBy: 'createdTime DESC');
    return result.map((e) => FileEntity.fromJson(e)).toList();
  }
}
