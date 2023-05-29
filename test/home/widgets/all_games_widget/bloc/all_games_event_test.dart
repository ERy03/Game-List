import 'package:flutter_test/flutter_test.dart';
import 'package:game_list/home/widgets/all_games_widget/bloc/all_games_bloc.dart';

void main() {
  group('AllGamesEvent', () {
    test('extends Equatable', () {
      expect(AllGamesEvent(), AllGamesEvent());
    });
  });
  group('GetGames', () {
    test('extends Equatable', () {
      expect(GetGames(), GetGames());
    });
  });
}
