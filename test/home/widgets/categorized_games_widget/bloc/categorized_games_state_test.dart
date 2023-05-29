import 'package:flutter_test/flutter_test.dart';
import 'package:game_list/home/widgets/categorized_games_widget/bloc/categorized_games_bloc.dart';

void main() {
  group('CategorizedGamesStatus', () {
    test('returns correct state when CategorizedGamesStatus is Initial', () {
      const status = CategorizedGamesStatus.initial;
      expect(status.isInitial, true);
      expect(status.isSuccess, false);
      expect(status.isError, false);
      expect(status.isLoading, false);
    });
    test('returns correct state when CategorizedGamesStatus is success', () {
      const status = CategorizedGamesStatus.success;
      expect(status.isInitial, false);
      expect(status.isSuccess, true);
      expect(status.isError, false);
      expect(status.isLoading, false);
    });
    test('returns correct state when CategorizedGamesStatus is error', () {
      const status = CategorizedGamesStatus.error;
      expect(status.isInitial, false);
      expect(status.isSuccess, false);
      expect(status.isError, true);
      expect(status.isLoading, false);
    });
    test('returns correct state when CategorizedGamesStatus is loading', () {
      const status = CategorizedGamesStatus.loading;
      expect(status.isInitial, false);
      expect(status.isSuccess, false);
      expect(status.isError, false);
      expect(status.isLoading, true);
    });
  });
  group('CategorizedGamesState', () {
    test('initial state is correct', () {
      expect(
          const CategorizedGamesState().status, CategorizedGamesStatus.initial);
      expect(const CategorizedGamesState().games, []);
      expect(const CategorizedGamesState().categoryName, '');
    });
  });
}
