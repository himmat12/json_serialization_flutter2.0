import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization_2021/models/movie_model.dart';

class MovieService {
  String authority = "api.themoviedb.org";
  String path = "/3/movie/popular";
  String authorization =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYTVlYmVmNThiMDhhZDgyNWYyNDU5MTg2MGIyNjk5MCIsInN1YiI6IjYwYTM1OTI2NzMxNGExMDA3OGZjZTRkOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VJG0GMDEpcYQBtm5VZlCHEmqTY5jH4kfIkYhosKqOA0";
  var client = http.Client();
  List<MovieModel> movies = [];

  Map<String, String> headers() => {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: authorization,
      };

  Map<String, dynamic> queryParma = {
    "api_key": "1a5ebef58b08ad825f24591860b26990"
  };

  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await client.get(Uri.https(authority, path, queryParma),
          headers: headers());

      if (response.statusCode == 200) {
        movies = List.from(jsonDecode(response.body)["results"]
            .map((e) => MovieModel.fromJson(e)));

        // ignore: avoid_print
        print(response.statusCode);

        for (var i in movies) {
          // ignore: avoid_print
          print(i.title);
        }

        return movies;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
