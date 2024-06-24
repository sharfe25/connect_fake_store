import 'package:connect_fake_store/models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Category model test', () {
    test('Return a valid instance of the model', () {
      CategoryModel category = CategoryModel(name: 'name');

      expect(category.name, equals('name'));
    });

    test('Return a valid string of the model', () {
      String category = CategoryModel(name: 'name').toString();

      expect(category, equals('Category(name: name)'));
    });
  });
}
