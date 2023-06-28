import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_screen/search_screen.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchScreen>> searchMovies(
      {required String movieQuery});
}
