import 'package:json_annotation/json_annotation.dart';

part 'year_year.g.dart';

@JsonSerializable()
class YearYear {
  const YearYear({
    this.year,
    this.count,
    this.nofollow,
  });

  final int? year;
  final int? count;
  final bool? nofollow;

  factory YearYear.fromJson(Map<String, dynamic> json) =>
      _$YearYearFromJson(json);
}
