import 'package:flutter/material.dart';

class MyErroMenssage extends StatelessWidget {
  final String menssage;
  final IconData? icon;

  const MyErroMenssage({super.key, required this.menssage, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) Icon(icon, size: 55),
        if (icon != null) SizedBox(height: 20),
        Text(
          menssage,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
