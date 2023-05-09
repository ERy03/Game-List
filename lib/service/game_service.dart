import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:game_list/models/game.dart';
import 'package:game_list/models/genre.dart';
import 'package:game_list/models/result.dart';
import 'package:game_list/secret.dart';
import 'package:game_list/service/api_endpoints.dart';

abstract class GameService {
  Future<Game> getGames();
  Future<List<Genre>> getGenres();
  Future<List<Result>> getGamesByGenre(int genreId);
}

class GameServiceImpl implements GameService {
  const GameServiceImpl({required this.dio});

  final Dio dio;

  // Provides API key so all requests can fetch data
  Uri getUrl({required String path, Map<String, String>? extraParameters}) {
    final queryParameters = <String, String>{
      'key': apiKey,
    };
    if (extraParameters != null) {
      queryParameters.addAll(extraParameters);
    }
    return Uri.parse('${ApiEndPoints.schema}://${ApiEndPoints.domain}/$path')
        .replace(queryParameters: queryParameters);
  }

  @override
  // Fetches all games
  Future<Game> getGames() async {
    try {
      final response = await dio.getUri(getUrl(path: ApiEndPoints.games));

      if (response.statusCode == 200) {
        try {
          return Game.fromJson(response.data);
        } catch (e) {
          debugPrint(e.toString());
          throw Exception('There was an error parsing the data');
        }
      } else {
        throw Exception('There was an error fetching games');
      }
    } catch (e) {
      if (e is SocketException) {
        throw Exception('No Internet Connection');
      } else {
        debugPrint('there was an error: ${e.toString()}');
        rethrow;
      }
    }
  }

  @override
  // Fetches all genres
  Future<List<Genre>> getGenres() async {
    try {
      final response = await dio.getUri(getUrl(path: ApiEndPoints.genres));

      if (response.statusCode == 200) {
        try {
          return List<Genre>.from(
            response.data['results'].map(
              (genre) => Genre.fromJson(genre),
            ),
          );
        } catch (e) {
          debugPrint(e.toString());
          throw Exception('There was an error parsing the data');
        }
      } else {
        throw Exception('There was an error fetching genres');
      }
    } catch (e) {
      if (e is SocketException) {
        throw Exception('No Internet Connection');
      } else {
        debugPrint('there was an error: ${e.toString()}');
        rethrow;
      }
    }
  }

  @override
  // Fetches games by genre
  Future<List<Result>> getGamesByGenre(int genreId) async {
    try {
      final response = await dio.getUri(
        getUrl(
          path: ApiEndPoints.games,
          extraParameters: <String, String>{
            'genres': genreId.toString(),
          },
        ),
      );

      if (response.statusCode == 200) {
        try {
          return List<Result>.from(
            response.data['results'].map(
              (game) => Result.fromJson(game),
            ),
          );
        } catch (e) {
          debugPrint(e.toString());
          throw Exception('There was an error parsing the data');
        }
      } else {
        throw Exception('There was an error fetching games by genre');
      }
    } catch (e) {
      if (e is SocketException) {
        throw Exception('No Internet Connection');
      } else {
        debugPrint('there was an error: ${e.toString()}');
        rethrow;
      }
    }
  }
}
