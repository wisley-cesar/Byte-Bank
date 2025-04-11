import 'package:bytebank/screens/contacts/widget/my_button_contacts.dart';
import 'package:bytebank/screens/contacts/widget/my_card_to_list.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Contatos'),
      body: MyCardToList(
        title: 'Wisley',
        subTitle: '465465465165',
        onTap: () {},
      ),
      floatingActionButton: MyButtonContacts(
        onPressed: () {
          Navigator.of(context).pushNamed('/contacts-form').then((newContact) {
            if (newContact != null) {
              
            }
          });
        },
      ),
    );
  }
}
