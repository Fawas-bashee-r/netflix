import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/presantation/fast_laugh/widget/video_list_item.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialized());
    });
    return Scaffold(
      body: SafeArea(child:
          BlocBuilder<FastLaughBloc, FastLaughState>(builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else if (state.isError) {
          return const Center(
            child: Text("Error Occured"),
          );
        } else if (state.videosList.isEmpty) {
          return const Center(child: Text("Video List Empty"));
        } else {
          return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.videosList.length,
                  (index) => VideoListItemInherited(
                        movieData: state.videosList[index],
                        widget: VideoListItem(
                          index: index,
                        ),
                        key: Key(index.toString()),
                      )));
        }
      })),
    );
  }
}
