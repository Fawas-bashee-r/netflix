import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/presantation/widgets/app_bar_widget.dart';

import '../../core/colors/constant.dart';

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
                    labelStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
            _buildTabBarView("he"),
            _buildTabBarView("hoy"),
          ]),
        ));
  }

  _buildTabBarView(String name) {
    return Center(child: Text("$name"));
  }
}
