import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:game_list/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:game_list/models/genre.dart';
import 'package:game_list/repository/game_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'category_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GameRepository>(), MockSpec<Genre>()])
void main() {
  group('CategoryBloc', () {
    late MockGameRepository mockGameRepository;
    late CategoryBloc categoryBloc;
    late List<MockGenre> mockListGenre;

    setUp(() {
      mockGameRepository = MockGameRepository();
      mockListGenre = [MockGenre()];
      categoryBloc = CategoryBloc(gameRepository: mockGameRepository);
    });

    test('initial state is CategoryState.initial', () {
      expect(categoryBloc.state.status, CategoryStatus.initial);
      expect(categoryBloc.state.categories, []);
      expect(categoryBloc.state.idSelected, 0);
    });

    group('GetCategories', () {
      blocTest<CategoryBloc, CategoryState>(
        'emits [CategoryStatus.loading, CategoryStatus.success] when GetCategories is added and getGenres() is Right.',
        setUp: () {
          when(mockGameRepository.getGenres())
              .thenAnswer((_) async => Right(mockListGenre));
        },
        build: () => categoryBloc,
        act: (bloc) => bloc.add(GetCategories()),
        expect: () => <CategoryState>[
          const CategoryState(status: CategoryStatus.loading),
          CategoryState(
            status: CategoryStatus.success,
            categories: mockListGenre,
          ),
        ],
        verify: (_) {
          verify(mockGameRepository.getGenres()).called(1);
          verifyNoMoreInteractions(mockGameRepository);
        },
      );
      blocTest<CategoryBloc, CategoryState>(
        'emits [CategoryStatus.loading, CategoryStatus.error] when GetCategories is added and getGenres() is Left.',
        setUp: () {
          when(mockGameRepository.getGenres())
              .thenAnswer((_) async => Left(Exception('error')));
        },
        build: () => categoryBloc,
        act: (bloc) => bloc.add(GetCategories()),
        expect: () => <CategoryState>[
          const CategoryState(status: CategoryStatus.loading),
          const CategoryState(
            status: CategoryStatus.error,
            categories: [],
            idSelected: 0,
          ),
        ],
        verify: (_) {
          verify(mockGameRepository.getGenres()).called(1);
          verifyNoMoreInteractions(mockGameRepository);
        },
      );
    });
    group('SelectCategory', () {
      blocTest<CategoryBloc, CategoryState>(
        'emits [CategoryStatus.selected] when SelectCategory is added.',
        build: () => categoryBloc,
        act: (bloc) => bloc.add(SelectCategory(idSelected: 1)),
        expect: () => <CategoryState>[
          const CategoryState(status: CategoryStatus.selected, idSelected: 1),
        ],
        verify: (_) {
          verifyZeroInteractions(mockGameRepository);
        },
      );
    });
  });
}
