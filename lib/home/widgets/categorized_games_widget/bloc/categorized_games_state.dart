part of 'categorized_games_bloc.dart';

enum CategorizedGamesStatus { initial, success, error, loading }

extension CategorizedGamesStatusX on CategorizedGamesStatus {
  bool get isInitial => this == CategorizedGamesStatus.initial;
  bool get isSuccess => this == CategorizedGamesStatus.success;
  bool get isError => this == CategorizedGamesStatus.error;
  bool get isLoading => this == CategorizedGamesStatus.loading;
}

class CategorizedGamesState extends Equatable {
  const CategorizedGamesState({
    this.status = CategorizedGamesStatus.initial,
    List<Result>? games,
    String? categoryName,
  })  : games = games ?? const [],
        categoryName = categoryName ?? '';

  final List<Result> games;
  final CategorizedGamesStatus status;
  final String categoryName;

  @override
  List<Object?> get props => [status, games, categoryName];

  CategorizedGamesState copyWith({
    List<Result>? games,
    CategorizedGamesStatus? status,
    String? categoryName,
  }) {
    return CategorizedGamesState(
      games: games ?? this.games,
      status: status ?? this.status,
      categoryName: categoryName ?? this.categoryName,
    );
  }
}
