import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/core/constant.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

class VideoListItemInherited extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInherited({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInherited oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VideoListItemInherited>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final posterPath = VideoListItemInherited.of(context)?.movieData.posterPath;
    return Stack(children: [
      Container(
        color: Colors.accents[index % Colors.accents.length],
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.volume_off))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundImage: posterPath == null
                                ? null
                                : NetworkImage("$imageUrls$posterPath")),
                        const SizedBox(height: 10),
                        const VideoActionsWidget(
                            icon: Icons.emoji_emotions, title: "LOL"),
                        VideoActionsWidget(icon: Icons.add, title: "My List"),
                        VideoActionsWidget(icon: Icons.share, title: "Share"),
                        VideoActionsWidget(
                            icon: Icons.play_arrow, title: "Play"),
                      ]),
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
