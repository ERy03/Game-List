import 'package:fpdart/fpdart.dart';
import 'package:game_list/models/game.dart';
import 'package:game_list/models/genre.dart';
import 'package:game_list/models/result.dart';
import 'package:game_list/repository/game_repository.dart';
import 'package:game_list/service/game_service.dart';

class GameImplementation extends GameRepository {
  GameImplementation(this.gameService);

  final GameService gameService;

  @override
  Future<Either<Exception, Game>> getGames() async {
    try {
      final games = await gameService.getGames();
      return right(games);
    } catch (e) {
      return left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, List<Genre>>> getGenres() async {
    try {
      final genres = await gameService.getGenres();
      return right(genres);
    } catch (e) {
      return left(e as Exception);
    }
  }

  @override
  Future<Either<Exception, List<Result>>> getGamesByGenre(int genreId) async {
    try {
      final games = await gameService.getGamesByGenre(genreId);
      return right(games);
    } catch (e) {
      return left(e as Exception);
    }
  }
}
