// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:game_list/models/filters.dart';
import 'package:game_list/models/result.dart';

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

  @override
  String toString() {
    return 'Game(count: $count, next: $next, previous: $previous, results: $results, seoTitle: $seoTitle, seoDescription: $seoDescription, seoKeywords: $seoKeywords, seoH1: $seoH1, noindex: $noindex, nofollow: $nofollow, description: $description, filters: $filters, nofollowCollections: $nofollowCollections)';
  }
}
