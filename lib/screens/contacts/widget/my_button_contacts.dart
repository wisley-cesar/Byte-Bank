import 'package:flutter/material.dart';

class MyButtonContacts extends StatelessWidget {
  final Function() onPressed;
  const MyButtonContacts({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
    );
  }
}
