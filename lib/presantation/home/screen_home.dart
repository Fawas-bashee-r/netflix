import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:netflix/core/colors/constant.dart';

import 'package:netflix/presantation/home/number_card.dart';
import 'package:netflix/presantation/search/widgets/title.dart';

import '../widgets/main_card.dart';
import 'costum_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;

                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = true;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = false;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(children: [
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      image: NetworkImage(kimage),
                                      fit: BoxFit.fill)),
                              width: 400,
                              height: 600,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Customwidget(
                                    title: "My List",
                                    icon: Icons.add,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  _playButton(),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  const Customwidget(
                                      icon: Icons.info_outline, title: "Info"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const NumberTitleCard(),
                    ]),
                    scrollNotifier.value == true
                        ? Column(
                            children: [
                              Container(
                                height: 40,
                                color: Colors.black,
                                child: Row(
                                  children: [
                                    Image.network(
                                      "https://cdn.vox-cdn.com/thumbor/sW5h16et1R3au8ZLVjkcAbcXNi8=/0x0:3151x2048/2000x1333/filters:focal(1575x1024:1576x1025)/cdn.vox-cdn.com/uploads/chorus_asset/file/15844974/netflixlogo.0.0.1466448626.png",
                                      width: 70,
                                      height: 70,
                                    ),
                                    const Spacer(),
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
                                      width: 25,
                                      height: 25,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 35,
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      "TV Shows",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Movies",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text("TV Catogeries",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                  ],
                ));
          }),
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Colors.white.withOpacity(.7))),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: Colors.black,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ));
  }
}

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SearchTextTitle(title: "Top 10 Tv shows in India Today"),
          LimitedBox(
            maxHeight: 210,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: ((context, index) => NumberCard(
                      index: index,
                    )),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ]),
        const SizedBox(
          height: 15,
        ),
        const MainTitleCard(
          title: "Released in the past year",
        ),
        const SizedBox(
          height: 15,
        ),
        const MainTitleCard(
          title: "Trending now",
        ),
        const SizedBox(
          height: 15,
        ),
        const MainTitleCard(title: "South Indain Cinema"),
        const SizedBox(
          height: 15,
        ),
        const MainTitleCard(title: "Tense Dramas")
      ],
    );
  }
}

class MainTitleCard extends StatelessWidget {
  final String title;
  const MainTitleCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SearchTextTitle(title: title),
      const SizedBox(
        height: 0,
      ),
      LimitedBox(
        maxHeight: 225,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) => const MainCard()),
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          ),
        ),
      )
    ]);
  }
}
