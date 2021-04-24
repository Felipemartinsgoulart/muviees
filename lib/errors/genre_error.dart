abstract class GenreError implements Exception {
  String message;

  @override
  String toString() {
    return message;
  }
}

class GenreRepositoryError extends GenreError {
  GenreRepositoryError(String message) {
    this.message = message;
  }
}
