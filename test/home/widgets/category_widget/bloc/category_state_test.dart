import 'package:flutter_test/flutter_test.dart';
import 'package:game_list/home/widgets/category_widget/bloc/category_bloc.dart';

void main() {
  group('CategoryStatus', () {
    test('returns correct state when CategoryStatus is Initial', () {
      const status = CategoryStatus.initial;
      expect(status.isInitial, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSelected, isFalse);
    });
    test('returns correct state when CategoryStatus is Success', () {
      const status = CategoryStatus.success;
      expect(status.isInitial, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isError, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSelected, isFalse);
    });
    test('returns correct state when CategoryStatus is Error', () {
      const status = CategoryStatus.error;
      expect(status.isInitial, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isTrue);
      expect(status.isLoading, isFalse);
      expect(status.isSelected, isFalse);
    });
    test('returns correct state when CategoryStatus is Loading', () {
      const status = CategoryStatus.loading;
      expect(status.isInitial, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
      expect(status.isLoading, isTrue);
      expect(status.isSelected, isFalse);
    });
    test('returns correct state when CategoryStatus is Selected', () {
      const status = CategoryStatus.selected;
      expect(status.isInitial, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isError, isFalse);
      expect(status.isLoading, isFalse);
      expect(status.isSelected, isTrue);
    });
  });
  group('CategoryState', () {
    test('initial state is correct', () {
      expect(const CategoryState().status, CategoryStatus.initial);
      expect(const CategoryState().categories, []);
      expect(const CategoryState().idSelected, 0);
    });
  });
}
