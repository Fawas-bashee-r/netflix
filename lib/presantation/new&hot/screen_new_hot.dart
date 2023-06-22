import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../core/colors/constant.dart';
import 'coming_soon.dart';
import 'everyones_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(110),
              child: AppBar(
                title: Text(
                  "New & Hot",
                  style: GoogleFonts.montserrat(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                actions: [
                  const Icon(
                    Icons.cast,
                    size: 30,
                    color: Colors.white,
                  ),
                  kWidth,
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://media.istockphoto.com/id/1313958250/vector/user-avatar-profile-icon-black-vector-illustration-on-transparent-background-website-or-app.jpg?s=612x612&w=0&k=20&c=oGGyxXc1jaRAopcs4ZEkZ1LbtAoQwKp4Q0niLvJNk-o="),
                            fit: BoxFit.fitWidth)),
                    //color: Colors.blue,
                    width: 25,
                    height: 20,
                  ),
                  kWidth,
                ],
                bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    labelStyle: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                    tabs: const [
                      Tab(
                        text: "🍿Coming Soon",
                      ),
                      Tab(
                        text: "👀Everyone's watching",
                      )
                    ]),
              )),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ]),
        ));
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (context, index) => const ComingSoonWidget(),
      itemCount: 7,
      shrinkWrap: true,
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
      itemCount: 10,
      shrinkWrap: true,
    );
  }
}
