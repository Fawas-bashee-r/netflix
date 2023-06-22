import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customwidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  const Customwidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        size: iconSize,
        color: Colors.white.withOpacity(.7),
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: textSize,
        ),
      )
    ]);
  }
}
