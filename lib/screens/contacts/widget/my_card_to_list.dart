import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/screens/contacts/widget/contact_item.dart';
import 'package:flutter/material.dart';

class MyCardToList extends StatelessWidget {
  final List<Contact> contacts = [];

  MyCardToList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final Contact contac = contacts[index];
        return ContactItem(contact: contac);
      },
    );
  }
}
