import 'package:flutter/cupertino.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg",
              ))),
    );
  }
}
