import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:game_list/home/widgets/categorized_games_widget/bloc/categorized_games_bloc.dart';
import 'package:game_list/models/result.dart';
import 'package:game_list/repository/game_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categorized_games_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GameRepository>(), MockSpec<Result>()])
void main() {
  group('AllGamesBloc', () {
    late MockGameRepository mockGameRepository;
    late CategorizedGamesBloc categorizedGamesBloc;
    late List<MockResult> mockListResult;

    setUp(() {
      mockGameRepository = MockGameRepository();
      mockListResult = [MockResult()];
      categorizedGamesBloc =
          CategorizedGamesBloc(gameRepository: mockGameRepository);
    });

    test('initial state is CategorizedGamesState.initial', () {
      expect(categorizedGamesBloc.state.status, CategorizedGamesStatus.initial);
    });

    blocTest<CategorizedGamesBloc, CategorizedGamesState>(
        'emits [CategorizedGamesStatus.loading, CategorizedGamesStatus.success] when GetCategorizedGames event is added and getGamesByGenre(1) returns Right.',
        setUp: () {
          when(mockGameRepository.getGamesByGenre(1))
              .thenAnswer((_) async => Right(mockListResult));
        },
        build: () => categorizedGamesBloc,
        act: (bloc) => bloc
            .add(GetCategorizedGames(idSelected: 1, categoryName: 'action')),
        expect: () => <CategorizedGamesState>[
              const CategorizedGamesState(
                  status: CategorizedGamesStatus.loading),
              CategorizedGamesState(
                status: CategorizedGamesStatus.success,
                games: mockListResult,
                categoryName: 'action',
              )
            ],
        verify: (_) {
          verify(mockGameRepository.getGamesByGenre(1)).called(1);
          verifyNoMoreInteractions(mockGameRepository);
        });
    blocTest<CategorizedGamesBloc, CategorizedGamesState>(
        'emits [CategorizedGamesStatus.loading, CategorizedGamesStatus.error] when GetCategorizedGames event is added and getGamesByGenre(1) returns Left.',
        setUp: () {
          when(mockGameRepository.getGamesByGenre(1))
              .thenAnswer((_) async => Left(Exception('error')));
        },
        build: () => categorizedGamesBloc,
        act: (bloc) => bloc
            .add(GetCategorizedGames(idSelected: 1, categoryName: 'action')),
        expect: () => <CategorizedGamesState>[
              const CategorizedGamesState(
                  status: CategorizedGamesStatus.loading),
              const CategorizedGamesState(
                status: CategorizedGamesStatus.error,
                games: [],
                categoryName: '',
              )
            ],
        verify: (_) {
          verify(mockGameRepository.getGamesByGenre(1)).called(1);
          verifyNoMoreInteractions(mockGameRepository);
        });
  });
}
