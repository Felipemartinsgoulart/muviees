import 'dart:convert';

class GenreModel {
  final int id;
  final String name;

  const GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(String str) =>
      GenreModel.fromMap(json.decode(str));

  factory GenreModel.fromMap(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );
}

class GenreDetailModel {
  final int id;
  final String name;

  const GenreDetailModel({
    this.id,
    this.name,
  });

  factory GenreDetailModel.fromJson(String str) =>
      GenreDetailModel.fromMap(json.decode(str));

  factory GenreDetailModel.fromMap(Map<String, dynamic> json) =>
      GenreDetailModel(
        id: json["id"],
        name: json["name"],
      );
}
