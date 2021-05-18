import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:json_serialization_2021/models/movie_model.dart';

class MovieService {
  String authority = "api.themoviedb.org";
  String path = "/3/movie/popular";
  
   // Bearer access token => follow video tutorial without skiping
  String authorization =
      "Bearer  <<access_token>>";
  var client = http.Client();
  List<MovieModel> movies = [];

  Map<String, String> headers() => {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: authorization,
      };

  Map<String, dynamic> queryParma = {
    // api_key access token => follow video tutorial without skiping
    "api_key": " <<api_key>>"
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
