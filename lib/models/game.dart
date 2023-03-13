import 'package:game_list/models/filters.dart';
import 'package:game_list/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Game {
  const Game({
    this.count,
    this.next,
    this.previous,
    required this.results,
    this.seoTitle,
    this.seoDescription,
    this.seoKeywords,
    this.seoH1,
    this.noindex,
    this.nofollow,
    this.description,
    this.filters,
    this.nofollowCollections,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<Result> results;
  final String? seoTitle;
  final String? seoDescription;
  final String? seoKeywords;
  final String? seoH1;
  final bool? noindex;
  final bool? nofollow;
  final String? description;
  final Filters? filters;
  final List<String>? nofollowCollections;

  static const empty = Game(
    count: 0,
    next: '',
    previous: '',
    results: [],
    seoTitle: '',
    seoDescription: '',
    seoKeywords: '',
    seoH1: '',
    noindex: false,
    nofollow: false,
    description: '',
    filters: Filters(years: []),
    nofollowCollections: [],
  );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
