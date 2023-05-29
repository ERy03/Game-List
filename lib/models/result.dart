// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:game_list/models/added_by_status.dart';
import 'package:game_list/models/esrb_rating.dart';
import 'package:game_list/models/genre.dart';
import 'package:game_list/models/parent_platform.dart';
import 'package:game_list/models/platform_element.dart';
import 'package:game_list/models/rating.dart';
import 'package:game_list/models/short_screenshot.dart';
import 'package:game_list/models/store.dart';

part 'result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Result {
  Result({
    required this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  final int id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionsCount;
  final DateTime? updated;
  final String? userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;
  final List<Store>? stores;
  final String? clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot>? shortScreenshots;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  @override
  String toString() {
    return 'Result(id: $id, slug: $slug, name: $name, released: $released, tba: $tba, backgroundImage: $backgroundImage, rating: $rating, ratingTop: $ratingTop, ratings: $ratings, ratingsCount: $ratingsCount, reviewsTextCount: $reviewsTextCount, added: $added, addedByStatus: $addedByStatus, metacritic: $metacritic, playtime: $playtime, suggestionsCount: $suggestionsCount, updated: $updated, userGame: $userGame, reviewsCount: $reviewsCount, saturatedColor: $saturatedColor, dominantColor: $dominantColor, platforms: $platforms, parentPlatforms: $parentPlatforms, genres: $genres, stores: $stores, clip: $clip, tags: $tags, esrbRating: $esrbRating, shortScreenshots: $shortScreenshots)';
  }
}
