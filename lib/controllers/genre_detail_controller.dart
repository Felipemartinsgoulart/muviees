import 'package:dartz/dartz.dart';
import '../errors/genre_error.dart';
import '../models/genres_model.dart';
import '../repositories/genre_repository.dart';

class GenreDetailController {
  final _repository = GenreRepository();

  GenreDetailModel genreDetail;
  GenreError genreError;

  bool loading = true;

  Future<Either<GenreError, GenreDetailModel>> fetchGenreById(int id) async {
    genreError = null;
    final result = await _repository.fetchGenreById(id);
    result.fold(
      (error) => genreError = error,
      (detail) => genreDetail = detail,
    );
    return result;
  }
}
