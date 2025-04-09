import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String imagePath;
  const MyImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(imagePath),
      ),
    );
  }
}
