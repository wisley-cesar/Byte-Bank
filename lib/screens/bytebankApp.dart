import 'package:bytebank/screens/contacts/contacts_form.dart';
import 'package:bytebank/screens/contacts/contacts_list.dart';
import 'package:bytebank/screens/home/dashborad.dart';
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
      routes: {
        '/home': (context) => Dashborad(),
        '/contacts': (context) => const ContactsList(),
        '/contacts-form': (context) => const ContactsForm(),
      },
    );
  }
}
