import 'dart:convert';

import 'package:goodfilms/models/movie.dart';
import 'package:goodfilms/models/movie_details.dart';
import 'package:goodfilms/services/constants.dart';
import 'package:http/http.dart' as http; 

class Api{
  static const _trendingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _movieDetailsUrl = 'https://api.themoviedb.org/3/movie/';

  Future<List<Movie> > getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else { 
      throw Exception('Failed to load trending movies'); 
    }
  }

  Future<List<Movie> > getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else { 
      throw Exception('Failed to load top rated movies'); 
    }
  }

  Future<List<Movie> > getUpcomingMovies() async{
    final response = await http.get(Uri.parse(_upcomingUrl ));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else { 
      throw Exception('Failed to load upcoming movies'); 
    }
  }

  Future<MovieDetails> getMovieDetails(int id) async {
    final response = await http.get(Uri.parse('$_movieDetailsUrl$id?api_key=${Constants.apiKey}'));
    if(response.statusCode == 200) {
      final movieDetails = movieDetailsFromJson(response.body);
      return movieDetails;
    } else {
      throw Exception('Failed to load movie details');
    }
  }
} 