import 'package:flutter_test/flutter_test.dart';
import 'package:game_list/home/widgets/category_widget/bloc/category_bloc.dart';

void main() {
  group('CategoryEvent', () {
    test('extends Equatable', () {
      expect(CategoryEvent(), CategoryEvent());
    });
  });
  group('GetCategories', () {
    test('extends Equatable', () {
      expect(GetCategories(), GetCategories());
    });
  });
  group('SelectCategory', () {
    test('extends Equatable', () {
      expect(SelectCategory(idSelected: 1), SelectCategory(idSelected: 1));
    });
  });
}
