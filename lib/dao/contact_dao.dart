import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String tablesql =
      'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, $_name  TEXT, $_account_number INTEGER )';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account_number = 'account_number';

  Future<void> save(Contact contact) async {
    final db = await createDataBase();
    await _toSave(db, contact);
  }

  Future<void> _toSave(Database db, Contact contact) async {
    await db.insert(_tableName, {
      _name: contact.name,
      _account_number: contact.accountNumber,
    });
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        id: row[_id],
        name: row[_name],
        accountNumber: row[_account_number],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
