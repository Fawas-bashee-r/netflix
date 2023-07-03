import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';

import '../../domain/core/failures/main_failure.dart';
import '../../domain/downloads/models/downloads.dart';

part 'downlaods_event.dart';
part 'downlaods_state.dart';
part 'downlaods_bloc.freezed.dart';

@Injectable()
class DownlaodsBloc extends Bloc<DownlaodsEvent, DownlaodsState> {
  final IDownloadRepo _downloadRepo;
  DownlaodsBloc(this._downloadRepo) : super(DownlaodsState.initial()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(state.copyWith(
        isLoaoding: true,
        failureOrSuccess: none(),
      ));

      final Either<MainFailure, List<Downloads>> downloadsOption =
          await _downloadRepo.getDownloadsImages();
      emit(
        downloadsOption.fold(
            (failure) => state.copyWith(
                isLoaoding: false,
                failureOrSuccess: some(Left(failure)),
                isError: true),
            (success) => state.copyWith(
                isLoaoding: false,
                failureOrSuccess: some(right(success)),
                downloads: success)),
      );
    });
  }
}
