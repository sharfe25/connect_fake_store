import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/models/rating_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product model test', () {
    test('Return a valid instance of the model', () {
      ProductModel product = ProductModel(
          id: 1,
          title: 'title',
          image: 'image',
          category: 'category',
          description: 'description',
          price: 10,
          rating: RatingModel.empty());

      expect(product.title, equals('title'));
      expect(product.price, equals(10));
    });

    test('Return a valid instance of the model from json', () {
      final Map<String, dynamic> jsonMap = <String, dynamic>{
        'id': 1,
        'title': 'title',
        'image': 'image',
        'category': 'category',
        'description': 'description',
        'price': 10,
        'rating': {
          'rate': 1,
          'count': 2,
        }
      };
      final ProductModel product = ProductModel.fromJson(jsonMap);

      expect(product.id, equals(1));
      expect(product.title, equals('title'));
    });

    test('Return a valid instance of the empty model', () {
      ProductModel product = ProductModel.empty();

      expect(product.title, equals(''));
      expect(product.category, equals(''));
    });

    test('Return a valid string of the model', () {
      String category = ProductModel(
              id: 1,
              title: 'title',
              image: 'image',
              category: 'category',
              description: 'description',
              price: 10,
              rating: RatingModel.empty())
          .toString();

      expect(category, equals('Product(\n id: 1, \n name: title, \n price: 10 \n)'));
    });
  });
}
