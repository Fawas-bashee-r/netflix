import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downlaods_bloc.dart';
import 'package:netflix/core/constant.dart';
import 'package:netflix/presantation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            child: AppBarWidget(
              title: " Downloads",
            ),
            preferredSize: Size.fromHeight(50)),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownlaodsBloc>(context)
          .add(const DownlaodsEvent.getDownloadImage());
    });

    return Column(
      children: [
        Text(
          "Introducing Downloads for you",
          style: GoogleFonts.actor(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 25),
        const Text(
          "We will download a personalized selection of\nmovies and shows for you, so there is\nalways something to watch on\nyour device",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        BlocBuilder<DownlaodsBloc, DownlaodsState>(
          builder: (context, state) {
            if (state.isLoaoding) {
              return SizedBox(
                width: 300,
                height: 330,
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state.downloads.isNotEmpty &&
                state.downloads.length >= 5) {
              return SizedBox(
                width: 300,
                height: 330,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.37,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                    ),
                    DownloadsImageWidget(
                      imageList: '$imageUrls${state.downloads[1].posterPath}',
                      margin: EdgeInsets.only(left: 165, bottom: 50),
                      angle: 20,
                    ),
                    DownloadsImageWidget(
                      imageList: '$imageUrls${state.downloads[4].posterPath}',
                      margin: EdgeInsets.only(right: 165, bottom: 50),
                      angle: -20,
                    ),
                    DownloadsImageWidget(
                      imageList: '$imageUrls${state.downloads[2].posterPath}',
                      margin: EdgeInsets.only(left: 0),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox
                  .shrink(); // Return an empty-sized widget if the downloads list is empty or insufficient
            }
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 380,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            onPressed: () {},
            color: Colors.blueAccent[700],
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 320,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            onPressed: () {},
            color: Colors.white,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        kWidth,
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(imageList))),
      ),
    );
  }
}
