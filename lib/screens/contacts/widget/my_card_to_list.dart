import 'package:flutter/material.dart';

class MyCardToList extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function() onTap;
  const MyCardToList({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text(title, style: TextStyle(fontSize: 24)),
            subtitle: Text(subTitle, style: TextStyle(fontSize: 16)),
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
