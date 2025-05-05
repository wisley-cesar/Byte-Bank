import 'package:bytebank/Model/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Function() onPressed;
  final Contact contact;
  const ContactItem({
    super.key,
    required this.contact,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onPressed,
        title: Text(contact.name, style: TextStyle(fontSize: 24)),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
