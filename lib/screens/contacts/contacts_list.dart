import 'package:bytebank/screens/contacts/widget/my_button_contacts.dart';
import 'package:bytebank/screens/contacts/widget/my_card_to_list.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Contatos'),
      body: MyCardToList(),
      floatingActionButton: MyButtonContacts(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/contacts-form');
          setState(() {});
        },
      ),
    );
  }
}
