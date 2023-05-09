import 'package:fpdart/fpdart.dart';
import 'package:game_list/models/game.dart';
import 'package:game_list/models/genre.dart';
import 'package:game_list/models/result.dart';

abstract class GameRepository {
  Future<Either<Exception, Game>> getGames();
  Future<Either<Exception, List<Genre>>> getGenres();
  Future<Either<Exception, List<Result>>> getGamesByGenre(int genreId);
}
