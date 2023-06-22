import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/constant.dart';
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
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    newAndhotImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      radius: 20,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.volume_off))),
                ),
              ],
            ),
            SizedBox(
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
            Text(
              "Coming on Friday",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 10),
            Text("The Witcher",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Text(
              "Destiny brought them together. Dangerous forces are trying to tear them apart. Gerald and Yennefer fight to keep Ciri safe as war brews on the Continent.",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      )
    ]);
  }
}
