import 'package:flutter/material.dart';

class MyProgressorIndequetor extends StatelessWidget {
  const MyProgressorIndequetor({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            strokeWidth: 5.0,
          ),
          SizedBox(height: 20),
          Text(
            'Aguarde...',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
