import 'package:dio/dio.dart';

const gBaseUrl = 'https://api.themoviedb.org/3/';
const gApiKey =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZmNhYWNjYThjYzIzMWM0YzJkMDc1ZGJhMTZkM2Q2MiIsInN1YiI6IjVmODM4YzJhOTVjMGFmMDAzOTdkZjU3ZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LPPQ2_7C3rBT4BPC4c3F2SShBkgpyFeS4X20k2oEUO4';

const gServerError = 'Failed to connect to the server. Try again later.';
final gDioOptions = BaseOptions(
  baseUrl: gBaseUrl,
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json;charset=utf-8',
  headers: {'Authorization': 'Bearer $gApiKey'},
);
//https://api.themoviedb.org/3/movie/latest?
