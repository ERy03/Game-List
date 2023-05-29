part of 'categorized_games_bloc.dart';

class CategorizedGamesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCategorizedGames extends CategorizedGamesEvent {
  GetCategorizedGames({
    required this.idSelected,
    required this.categoryName,
  });
  final int idSelected;
  final String categoryName;

  @override
  List<Object?> get props => [idSelected, categoryName];
}
