import 'package:json_annotation/json_annotation.dart';

import '../../../../core/constant.dart';

part 'search_screen.g.dart';

@JsonSerializable()
class SearchScreen {
  @JsonKey(name: 'results')
  List<SearchResult>? results;

  SearchScreen({
    this.results = const [],
  });

  factory SearchScreen.fromJson(Map<String, dynamic> json) {
    return _$SearchScreenFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchScreenToJson(this);
}

@JsonSerializable()
class SearchResult {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl => '$imageUrls$posterPath';

  SearchResult({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return _$SearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
