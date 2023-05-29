import 'package:flutter_test/flutter_test.dart';
import 'package:game_list/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:game_list/models/game.dart';

void main() {
  group('AllGamesStatus', () {
    test('returns correct state when AllGamesStatus is Initial', () {
      const status = AllGamesStatus.initial;
      expect(status.isInitial, true);
      expect(status.isSuccess, false);
      expect(status.isError, false);
      expect(status.isLoading, false);
    });
    test('returns correct state when AllGamesStatus is success', () {
      const status = AllGamesStatus.success;
      expect(status.isInitial, false);
      expect(status.isSuccess, true);
      expect(status.isError, false);
      expect(status.isLoading, false);
    });
    test('returns correct state when AllGamesStatus is error', () {
      const status = AllGamesStatus.error;
      expect(status.isInitial, false);
      expect(status.isSuccess, false);
      expect(status.isError, true);
      expect(status.isLoading, false);
    });
    test('returns correct state when AllGamesStatus is loading', () {
      const status = AllGamesStatus.loading;
      expect(status.isInitial, false);
      expect(status.isSuccess, false);
      expect(status.isError, false);
      expect(status.isLoading, true);
    });
  });
  group('AllGamesState', () {
    test('initial state is correct', () {
      expect(const AllGamesState().status, AllGamesStatus.initial);
      expect(const AllGamesState().games, Game.empty);
    });
  });
}
