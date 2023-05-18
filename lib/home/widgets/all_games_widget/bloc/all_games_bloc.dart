import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list/models/game.dart';
import 'package:game_list/repository/game_repository.dart';

part 'all_games_event.dart';
part 'all_games_state.dart';

class AllGamesBloc extends Bloc<AllGamesEvent, AllGamesState> {
  AllGamesBloc({
    required this.gameRepository,
  }) : super(const AllGamesState()) {
    on<GetGames>(_mapGetGamesEventToState);
  }

  final GameRepository gameRepository;

  void _mapGetGamesEventToState(
      GetGames event, Emitter<AllGamesState> emit) async {
    emit(state.copyWith(status: AllGamesStatus.loading));
    final games = await gameRepository.getGames();
    games.fold((l) {
      debugPrint(l.toString());
      emit(state.copyWith(status: AllGamesStatus.error));
    },
        (r) => emit(
              state.copyWith(
                status: AllGamesStatus.success,
                games: r,
              ),
            ));
  }
}
