import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:modulhttp/models/movie.dart';

class HttpService {
  final String apiKey = '260f7b3aa42e5f1cdb94ca4f44d9b184';
  final String baseUrl = 'http://api.themoviedb.org/3/movie/popular?api_key=';

  
  Future<List> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}