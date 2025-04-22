import 'package:bytebank/screens/contacts/widget/my_button_contacts.dart';
import 'package:bytebank/screens/contacts/widget/my_card_to_list.dart';
import 'package:bytebank/utils/my_rotas.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class TransferList extends StatefulWidget {
  const TransferList({super.key});

  @override
  State<TransferList> createState() => _ContactsListState();
}

class _ContactsListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'List de transferências'),
      body: MyCardToList(),
      floatingActionButton: MyButtonContacts(
        onPressed: () async {
          await Navigator.of(context).pushNamed(MyRotas.contactsForm);
          setState(() {});
        },
      ),
    );
  }
}
