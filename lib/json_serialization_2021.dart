import 'package:flutter/material.dart';
import 'package:json_serialization_2021/services/movie_service.dart';

class JsonSerialization2021 extends StatefulWidget {
  @override
  _JsonSerialization2021State createState() => _JsonSerialization2021State();
}

class _JsonSerialization2021State extends State<JsonSerialization2021> {
  MovieService _movieService = MovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON & Serialization Flutter 2.0'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            _movieService.getMovies();
          },
          child: const Text('Request'),
        ),
      ),
    );
  }
}
