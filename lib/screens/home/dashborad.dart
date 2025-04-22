import 'package:bytebank/utils/my_rotas.dart';
import 'package:bytebank/widget/my_app_bar.dart';
import 'package:bytebank/screens/home/widget/my_button.dart';
import 'package:bytebank/screens/home/widget/my_image.dart';
import 'package:flutter/material.dart';

class Dashborad extends StatelessWidget {
  const Dashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Dashboard'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyImage(imagePath: 'images/bytebank_logo.png'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyButton(
                  icon: Icons.monetization_on,
                  title: 'Tranferencias',
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyRotas.transfer);
                  },
                ),
                MyButton(
                  icon: Icons.description,
                  title: 'Transação',
                  onPressed: () {
                    Navigator.of(context).pushNamed(MyRotas.trasactionList);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
