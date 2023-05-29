import 'package:flutter_test/flutter_test.dart';
import 'package:game_list/home/widgets/categorized_games_widget/bloc/categorized_games_bloc.dart';

void main() {
  group('CategorizedGamesEvent', () {
    test('extends Equatable', () {
      expect(CategorizedGamesEvent(), CategorizedGamesEvent());
    });
  });
  group('GetCategorizedGames', () {
    test('extends Equatable', () {
      expect(GetCategorizedGames(idSelected: 1, categoryName: 'action'),
          GetCategorizedGames(idSelected: 1, categoryName: 'action'));
    });
  });
}
