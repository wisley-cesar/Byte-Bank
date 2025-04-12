import 'package:bytebank/Model/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name  TEXT, account_number INTEGER )',
      );
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) async {
  //       await db.execute(
  //         'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name  TEXT, account_number INTEGER )',
  //       );
  //     },
  //     version: 1,
  //     // onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });
}

Future<void> save(Contact contact) async {
  final db = await createDataBase();
  await db.insert('contacts', {
    'name': contact.name,
    'account_number': contact.accountNumber,
  });
}

Future<List<Contact>> findAll() async {
  final Database db = await createDataBase();
  final List<Map<String, dynamic>> result = await db.query('contacts');

  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      id: row['id'],
      name: row['name'],
      accountNumber: row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}

  // final db = await createDataBase();
  // return db.query('contacts').then((maps) {
  //   final List<Contact> contacts = [];
  //   for (Map<String, dynamic> map in maps) {
  //     final Contact contact = Contact(
  //       id: map['id'],
  //       name: map['name'],
  //       accountNumber: map['account_number'],
  //     );
  //     contacts.add(contact);
  //   }
  //   return contacts;
  // });

