class Movie{
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final double voteAverage;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      originalTitle: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
    );
  } 
}

// {
//   "backdrop_path": "/nazLAYvFewST34QMueOq4MlYKoc.jpg",
//   "id": 402431,
//   "title": "Wicked",
//   "original_title": "Wicked",
//   "overview": "Elphaba, an ostracized but defiant girl born with green skin, and Galinda, a privileged aristocrat born popular, become extremely unlikely friends in the magical Land of Oz. As the two girls struggle with their opposing personalities, their friendship is tested as both begin to fulfil their destinies as Glinda the Good and The Wicked Witch of the West.",
//   "poster_path": "/c5Tqxeo1UpBvnAc3csUm7j3hlQl.jpg",
//   "media_type": "movie",
//   "adult": false,
//   "original_language": "en",
//   "genre_ids": [
//     18,
//     14,
//     10749
//   ],
//   "popularity": 791.164,
//   "release_date": "2024-11-20",
//   "video": false,
//   "vote_average": 7.7,
//   "vote_count": 20
// }