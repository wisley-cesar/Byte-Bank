import 'package:bytebank/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(ContactDao.tablesql);
    },
    version: 1,
  );
}
