import 'package:game_list/models/year_year.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filters_year.g.dart';

@JsonSerializable()
class FiltersYear {
  FiltersYear({
    this.from,
    this.to,
    this.filter,
    this.decade,
    this.years,
    this.nofollow,
    this.count,
  });

  final int? from;
  final int? to;
  final String? filter;
  final int? decade;
  final List<YearYear>? years;
  final bool? nofollow;
  final int? count;

  factory FiltersYear.fromJson(Map<String, dynamic> json) =>
      _$FiltersYearFromJson(json);
}
