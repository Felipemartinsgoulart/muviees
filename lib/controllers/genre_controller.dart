import 'package:dartz/dartz.dart';

import '../errors/genre_error.dart';
import '../models/genres_model.dart';
import '../models/genre_response_model.dart';
import '../repositories/genre_repository.dart';

class GenreController {
  final _repository = GenreRepository();

  GenreResponseModel genreResponseModel;
  GenreError genreError;
  bool loading = true;

  List<GenreModel> get genres => genreResponseModel?.genres ?? <GenreModel>[];
  int get genreCount => genres.length;
  bool get hasGenres => genreCount != 0;
  int get totalPages => genreResponseModel?.totalPages ?? 1;
  int get currentPageGenre => genreResponseModel?.page ?? 1;

  Future<Either<GenreError, GenreResponseModel>> fetchAllMovies(
      {int page = 1}) async {
    genreError = null;
    final result = await _repository.fetchAllGenres(page);
    result.fold(
      (error) => genreError = error,
      (genre) {
        if (genreResponseModel == null) {
          genreResponseModel = genre;
        } else {
          genreResponseModel.page = genre.page;
          genreResponseModel.genres.addAll(genre.genres);
        }
      },
    );

    return result;
  }
}
