part of 'downlaods_bloc.dart';

@freezed
class DownlaodsState with _$DownlaodsState {
  const factory DownlaodsState(
      {required bool isLoaoding,
      required List<Downloads> downloads,
      required Option<Either<MainFailure, List<Downloads>>> failureOrSuccess,
      required bool isError}) = _DownloadState;

  factory DownlaodsState.initial() {
    return const DownlaodsState(
      isError: false,
      downloads: [],
      isLoaoding: false,
      failureOrSuccess: None(),
    );
  }
}
