// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromJson(jsonString);

import 'dart:convert';

MovieDetails movieDetailsFromJson(String str) => MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
    List<Genre> genres;
    int runtime;
    String tagline;

    MovieDetails({
        required this.genres,
        required this.runtime,
        required this.tagline,
    });

    factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        runtime: json["runtime"],
        tagline: json["tagline"],
    );

    Map<String, dynamic> toJson() => {
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "runtime": runtime,
        "tagline": tagline,
    };
}

class Genre {
    String name;

    Genre({
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
