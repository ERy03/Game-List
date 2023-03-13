import 'package:game_list/models/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store {
  Store({
    this.id,
    this.store,
  });

  final int? id;
  final Genre? store;

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
}
