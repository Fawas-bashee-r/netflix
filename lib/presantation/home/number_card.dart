import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(height: 150, width: 30),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg",
                      ))),
            ),
          ],
        ),
        Positioned(
          left: 0,
          bottom: -20,
          child: StrokeText(
            text: "${index + 1}",
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 120,
                color: Color.fromARGB(255, 0, 0, 0)),
            strokeColor: Color.fromARGB(255, 255, 255, 255),
            strokeWidth: 7,
          ),
        ),
      ],
    );
  }
}
