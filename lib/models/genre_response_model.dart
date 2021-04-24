import 'dart:convert';

import 'genres_model.dart';

class GenreResponseModel {
  int page;
  final int totalResults;
  final int totalPages;
  final List<GenreModel> genres;

  GenreResponseModel({
    this.page,
    this.totalResults,
    this.totalPages,
    this.genres,
  });

  factory GenreResponseModel.fromJson(String str) =>
      GenreResponseModel.fromMap(json.decode(str));

  factory GenreResponseModel.fromMap(Map<String, dynamic> json) =>
      GenreResponseModel(
        page: json["id"],
        totalResults: json["total_results"],
        totalPages: json["total_pages"],
        genres: List<GenreModel>.from(
            json["results"].map((x) => GenreModel.fromMap(x))),
      );
}
