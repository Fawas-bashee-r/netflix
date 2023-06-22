import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/presantation/search/widgets/title.dart';

const imageUrl =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/1inZm0xxXrpRfN0LxwE2TXzyLN6.jpg";

class SearchIdle extends StatelessWidget {
  SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: "Top Searches",
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: ((context, index) => TopSearchItem()),
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          height: 80,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(imageUrl),
          )),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text("John Wick",
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.w600)),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 20,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 17,
            child: Icon(
              CupertinoIcons.play_fill,
              size: 17,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
