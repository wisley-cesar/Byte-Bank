// ignore: file_names
import 'package:bytebank/screens/contacts/contacts_form.dart';
import 'package:bytebank/screens/contacts/transfer_list.dart';
import 'package:bytebank/screens/home/dashborad.dart';
import 'package:bytebank/screens/transaction/TransactionsList.dart';
import 'package:bytebank/utils/my_rotas.dart';
import 'package:flutter/material.dart';

class Bytebankapp extends StatelessWidget {
  const Bytebankapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Dashborad(),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRotas.home,
      routes: {
        MyRotas.home: (context) => Dashborad(),
        MyRotas.contactsForm: (context) => const ContactsForm(),
        MyRotas.transfer: (context) => TransferList(),
        MyRotas.trasactionList: (context) => TransactionsList(),
      },
    );
  }
}
