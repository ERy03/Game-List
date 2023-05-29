// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'genre.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  Genre({
    required this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  final int id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  @override
  String toString() {
    return 'Genre(id: $id, name: $name, slug: $slug, gamesCount: $gamesCount, imageBackground: $imageBackground, domain: $domain, language: $language)';
  }
}
