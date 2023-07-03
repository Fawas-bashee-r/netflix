import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final _videoUrls = [
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"
];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<Initialized>((event, emit) async {
      emit(const FastLaughState(
          videosList: [], isLoading: true, isError: false));
      final result = await _downloadService.getDownloadsImages();
      final state = result.fold(
          (l) => const FastLaughState(
                videosList: [],
                isLoading: false,
                isError: true,
              ),
          (resp) => FastLaughState(
                videosList: resp,
                isLoading: false,
                isError: false,
              ));
      emit(state);
    });
  }
}
