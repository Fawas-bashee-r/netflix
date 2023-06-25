import 'package:flutter/material.dart';
import 'package:netflix/core/colors.dart';
import 'package:netflix/presantation/downloads/widgets/screen_downloads.dart';
import 'package:netflix/presantation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix/presantation/home/screen_home.dart';
import 'package:netflix/presantation/main%20page/widgets/bottom_nav.dart';
import 'package:netflix/presantation/new&hot/screen_new_hot.dart';
import 'package:netflix/presantation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});
  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int value, child) => _pages[value]),
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
