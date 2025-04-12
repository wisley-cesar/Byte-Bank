import 'dart:math';

import 'package:bytebank/Model/contact.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatefulWidget {
  ContactsForm({super.key});

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(title: 'Novo Contato'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(label: Text('Nome Completo')),
              style: TextStyle(fontSize: 24),
            ),
            TextFormField(
              controller: _accountNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(label: Text('Numero da Conta')),
              style: TextStyle(fontSize: 24),
            ),

            SizedBox(height: 20),

            Material(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {
                  final String name = _nameController.text;
                  final int? accountNumber = int.tryParse(
                    _accountNumberController.text,
                  );
                  final Contact newContact = Contact(
                    name: name,
                    accountNumber: accountNumber!,
                  );
                  save(newContact).then((id) => Navigator.pop(context));
                },
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Criar',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
