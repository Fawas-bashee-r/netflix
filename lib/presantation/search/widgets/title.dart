import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
  const SearchTextTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style:
            GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold));
  }
}
