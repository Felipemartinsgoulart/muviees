import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../models/genres_model.dart';
import '../core/api_genre.dart';
import '../errors/genre_error.dart';
import '../models/genre_response_model.dart';

class GenreRepository {
  final Dio _dio = Dio(gDioOptions);

  Future<Either<GenreError, GenreResponseModel>> fetchAllGenres(
      int page) async {
    try {
      final response = await _dio.get('/genre/movie/list?id=$page');
      final model = GenreResponseModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            GenreRepositoryError(error.response.data['status_message']));
      } else {
        return Left(GenreRepositoryError(gServerError));
      }
    } on Exception catch (error) {
      return Left(GenreRepositoryError(error.toString()));
    }
  }

  Future<Either<GenreError, GenreDetailModel>> fetchGenreById(int id) async {
    try {
      final response = await _dio.get('/genre/$id');
      final model = GenreDetailModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error.response != null) {
        return Left(
            GenreRepositoryError(error.response.data['status_message']));
      } else {
        return Left(GenreRepositoryError(gServerError));
      }
    } on Exception catch (error) {
      return Left(GenreRepositoryError(error.toString()));
    }
  }
}
