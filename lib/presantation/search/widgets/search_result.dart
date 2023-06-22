import 'package:flutter/material.dart';

import 'package:netflix/presantation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Movies & Tv"),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 30,
          crossAxisSpacing: 25,
          shrinkWrap: true,
          childAspectRatio: 1 / 1.4,
          children: List.generate(20, (index) => MainCard()),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          )),
    );
  }
}
