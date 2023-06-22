import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/constant.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style:
              GoogleFonts.montserrat(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          size: 30,
          color: Colors.white,
        ),
        kWidth,
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/id/1313958250/vector/user-avatar-profile-icon-black-vector-illustration-on-transparent-background-website-or-app.jpg?s=612x612&w=0&k=20&c=oGGyxXc1jaRAopcs4ZEkZ1LbtAoQwKp4Q0niLvJNk-o="),
                  fit: BoxFit.fitWidth)),
          width: 25,
          height: 25,
        ),
        kWidth,
      ],
    );
  }
}
