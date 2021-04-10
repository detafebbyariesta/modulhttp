class Movie {
  int id;
  String originalTitle;
  double voteAverage;
  String overview;
  String posterPath;

  Movie(this.id, this.originalTitle, this.voteAverage, this.overview,
      this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.originalTitle = parsedJson['original_title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}