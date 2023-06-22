import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customwidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const Customwidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        size: 30,
        color: Colors.white.withOpacity(.7),
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
        ),
      )
    ]);
  }
}
