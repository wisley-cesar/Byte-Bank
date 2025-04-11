import 'package:bytebank/Model/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name  TEXT, account_number INTEGER )',
        );
      },
      version: 1,
    );
  });
}

Future<void> save(Contact contact) async {
  final db = await createDataBase();
  await db.insert('contacts', {
    'name': contact.name,
    'account_number': contact.accountNumber,
  });
}

Future<List<Contact>> findAll() async {
  final db = await createDataBase();
  return db.query('contacts').then((maps) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> map in maps) {
      final Contact contact = Contact(
        id: map['id'],
        name: map['name'],
        accountNumber: map['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  });
}
