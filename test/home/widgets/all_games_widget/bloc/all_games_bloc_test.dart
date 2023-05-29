import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:game_list/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:game_list/models/game.dart';
import 'package:game_list/repository/game_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'all_games_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GameRepository>(), MockSpec<Game>()])
void main() {
  group('AllGamesBloc', () {
    late MockGameRepository mockGameRepository;
    late AllGamesBloc allGamesBloc;
    late MockGame mockGame;

    setUp(() {
      mockGameRepository = MockGameRepository();
      mockGame = MockGame();
      allGamesBloc = AllGamesBloc(gameRepository: mockGameRepository);
    });

    test('initial state is AllGamesStatus.initial', () {
      expect(allGamesBloc.state.status, AllGamesStatus.initial);
    });

    blocTest<AllGamesBloc, AllGamesState>(
        'emits [AllGamesStatus.loading, AllGamesStatus.success] when GetGames event is added and getGames returns Right.',
        setUp: () {
          when(mockGameRepository.getGames())
              .thenAnswer((_) async => Right(mockGame));
        },
        build: () => allGamesBloc,
        act: (bloc) => bloc.add(GetGames()),
        expect: () => <AllGamesState>[
              const AllGamesState(status: AllGamesStatus.loading),
              AllGamesState(
                status: AllGamesStatus.success,
                games: mockGame,
              )
            ],
        verify: (_) {
          verify(mockGameRepository.getGames()).called(1);
          verifyNoMoreInteractions(mockGameRepository);
        });
    blocTest<AllGamesBloc, AllGamesState>(
        'emits [AllGamesStatus.loading, AllGamesStatus.error] when GetGames event is added and getGames returns Left.',
        setUp: () {
          when(mockGameRepository.getGames())
              .thenAnswer((_) async => Left(Exception('error')));
        },
        build: () => allGamesBloc,
        act: (bloc) => bloc.add(GetGames()),
        expect: () => <AllGamesState>[
              const AllGamesState(status: AllGamesStatus.loading),
              const AllGamesState(
                  status: AllGamesStatus.error, games: Game.empty)
            ],
        verify: (_) {
          verify(mockGameRepository.getGames()).called(1);
          verifyNoMoreInteractions(mockGameRepository);
        });
  });
}
