import 'package:bytebank/screens/dashborad.dart';
import 'package:flutter/material.dart';

class Bytebankapp extends StatelessWidget {
  const Bytebankapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Dashborad(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
