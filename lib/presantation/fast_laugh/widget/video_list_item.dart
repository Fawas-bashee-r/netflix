import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
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
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                              "https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg"),
                        ),
                        SizedBox(height: 10),
                        VideoActionsWidget(
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
