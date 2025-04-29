import 'package:bytebank/Model/contact.dart';

class MyTransaction {
  final double value;
  final Contact contact;

  MyTransaction({required this.value, required this.contact});

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }
}
