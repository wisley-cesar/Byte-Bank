import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPressed;
  const MyButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 38.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: onPressed,
          child: SizedBox(
            height: 100,
            width: 155,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: Colors.white, size: 25),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
