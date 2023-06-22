import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presantation/new&hot/video_widget.dart';

import '../home/costum_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const VideoWidget(),
        const SizedBox(
          height: 10,
        ),
        Row(children: const [
          Text(
            "THE WITCHER",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Customwidget(
            icon: Icons.share_outlined,
            title: "Share",
            iconSize: 25,
            textSize: 13,
          ),
          SizedBox(
            width: 20,
          ),
          Customwidget(
            icon: Icons.add,
            title: "My List",
            iconSize: 25,
            textSize: 15,
          ),
          SizedBox(
            width: 20,
          ),
          Customwidget(
            icon: Icons.play_arrow_sharp,
            title: "Play",
            iconSize: 25,
            textSize: 13,
          )
        ]),
        Column(
          children: const [
            SizedBox(height: 10),
            Text(
              "Destiny brought them together. Dangerous forces are trying to tear them apart. Gerald and Yennefer fight to keep Ciri safe as war brews on the Continent.",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
