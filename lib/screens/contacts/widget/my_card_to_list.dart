import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/dao/contact_dao.dart';
import 'package:bytebank/screens/contacts/widget/contact_item.dart';
import 'package:bytebank/widget/my_progressor_indequetor.dart';
import 'package:flutter/material.dart';

class MyCardToList extends StatelessWidget {
  final ContactDao _contactDao = ContactDao();
  MyCardToList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Contact>>(
      future: _contactDao.findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: MyProgressorIndequetor());
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
