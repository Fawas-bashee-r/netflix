import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/constant.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

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
    final videoUrl = dummyvideoUrls[index % dummyvideoUrls.length];
    // print(dummyvideoUrls.length);
    return Stack(children: [
      VideoPlayers(videoUrl: videoUrl, onStateChanged: (r) {}),
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
                        GestureDetector(
                          onTap: () {
                            final movieName = VideoListItemInherited.of(context)
                                ?.movieData
                                .title;
                            if (movieName != null) {
                              Share.share(movieName);
                            }
                          },
                          child: VideoActionsWidget(
                              icon: Icons.share, title: "Share"),
                        ),
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

class VideoPlayers extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  VideoPlayers(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<VideoPlayers> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayers> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
