import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/constant.dart';
import 'package:netflix/presantation/search/widgets/search_idle.dart';
import 'package:netflix/presantation/search/widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              placeholder: "Search for titles,genres or people",
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 17),
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Expanded(child: SearchIdle()),

            Expanded(child: SearchResultWidget())
          ],
        ),
      )),
    );
  }
}
