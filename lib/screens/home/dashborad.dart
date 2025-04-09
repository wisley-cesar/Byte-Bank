import 'package:bytebank/screens/home/widget/my_app_bar.dart';
import 'package:bytebank/screens/home/widget/my_button.dart';
import 'package:bytebank/screens/home/widget/my_image.dart';
import 'package:flutter/material.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyImage(imagePath: 'images/bytebank_logo.png'),
          MyButton(
            icon: Icons.people,
            title: 'Contats',
            onPressed: () {
              print('teste');
            },
          ),
        ],
      ),
    );
  }
}
