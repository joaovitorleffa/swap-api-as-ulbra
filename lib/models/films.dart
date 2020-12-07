class Films {
  final String title;
  final String director;
  final String releaseDate;

  Films({this.title, this.director, this.releaseDate});

  factory Films.fromJson(Map json) {
    return Films(
      title: json['title'],
      director: json['director'],
      releaseDate: json['release_date'],
    );
  }

  Map toJson() {
    return {
      'title': title,
      'director': director,
      'release_date': releaseDate,
    };
  }
}