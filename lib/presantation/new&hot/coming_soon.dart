import 'package:flutter/material.dart';
import 'package:netflix/presantation/new&hot/video_widget.dart';

import '../home/costum_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(children: [
      SizedBox(
        width: 50,
        height: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("FEB",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            Text(
              "11",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: size.width - 60,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const VideoWidget(),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "THE WITCHER",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Customwidget(
                  icon: Icons.access_alarms_outlined,
                  title: "Remind",
                  iconSize: 25,
                  textSize: 13,
                ),
                SizedBox(
                  width: 20,
                ),
                Customwidget(
                  icon: Icons.info_outline,
                  title: "Info",
                  iconSize: 25,
                  textSize: 15,
                )
              ],
            ),
            const Text(
              "Coming on Friday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            const SizedBox(height: 10),
            const Text("The Witcher",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text(
              "Destiny brought them together. Dangerous forces are trying to tear them apart. Gerald and Yennefer fight to keep Ciri safe as war brews on the Continent.",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      )
    ]);
  }
}
