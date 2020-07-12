class MovieData {

  static final List movieList = [
    Movie(movie: 'Kabil', url: 'assets/kabil.jpg'),
    Movie(movie: 'Aquaman', url: 'assets/aquaman.jpg'),
    Movie(movie: 'Hell Boy', url: 'assets/hellboy.jpg'),
    Movie(movie: 'Black Widow', url: 'assets/black.jpeg'),
    Movie(movie: 'Queen', url: 'assets/queen.webp'),
    Movie(movie: 'Kabil', url: 'assets/kabil.jpg'),
    Movie(movie: 'Aquaman', url: 'assets/aquaman.jpg'),
    Movie(movie: 'Hell Boy', url: 'assets/hellboy.jpg'),
    Movie(movie: 'Black Widow', url: 'assets/black.jpeg'),
    Movie(movie: 'Queen', url: 'assets/queen.webp'),

  ];
}

class Movie {
  final String movie;
  final String url;

  Movie({this.movie, this.url});
}