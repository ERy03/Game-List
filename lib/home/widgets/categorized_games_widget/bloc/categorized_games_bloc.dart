import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_list/models/result.dart';
import 'package:game_list/repository/game_repository.dart';

part 'categorized_games_event.dart';
part 'categorized_games_state.dart';

class CategorizedGamesBloc
    extends Bloc<CategorizedGamesEvent, CategorizedGamesState> {
  CategorizedGamesBloc({
    required this.gameRepository,
  }) : super(const CategorizedGamesState()) {
    on<GetCategorizedGames>(_mapGetCategorizedGamesEventToState);
  }
  final GameRepository gameRepository;

  void _mapGetCategorizedGamesEventToState(
      GetCategorizedGames event, Emitter<CategorizedGamesState> emit) async {
    emit(state.copyWith(status: CategorizedGamesStatus.loading));

    final categorizedGames =
        await gameRepository.getGamesByGenre(event.idSelected);

    categorizedGames.fold(
      (l) {
        debugPrint(l.toString());
        emit(state.copyWith(status: CategorizedGamesStatus.error));
      },
      (r) => emit(
        state.copyWith(
          status: CategorizedGamesStatus.success,
          games: r,
          categoryName: event.categoryName,
        ),
      ),
    );
  }
}
