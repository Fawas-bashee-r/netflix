import 'package:flutter/cupertino.dart';

import '../search/widgets/search_result.dart';
import '../search/widgets/title.dart';

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
      SizedBox(
        height: 10,
      ),
      LimitedBox(
        maxHeight: 210,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) => const SizedBox()),
            separatorBuilder: (context, index) => SizedBox(
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
