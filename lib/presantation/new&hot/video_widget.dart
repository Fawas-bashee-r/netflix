import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/constant.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.volume_off))),
        ),
      ],
    );
  }
}
