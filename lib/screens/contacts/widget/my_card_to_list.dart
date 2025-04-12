import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/screens/contacts/widget/contact_item.dart';
import 'package:flutter/material.dart';

class MyCardToList extends StatelessWidget {
  const MyCardToList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final List<Contact> contacts = snapshot.data ?? [];
          if (contacts.isEmpty) {
            return Center(
              child: Text(
                'Nenhum contato encotrado',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final Contact contac = contacts[index];
              return ContactItem(contact: contac);
            },
          );
        } else {
          return Text('Nenhum contato disponível');
        }
      },
    );
  }
}
