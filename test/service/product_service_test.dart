import 'package:connect_fake_store/services/product_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_http_adapter.dart';

void main() {
  group('ProductService', () {
    late ProductService productService;
    late MockHTTPAdapter mockHTTPAdapter;

    setUp(() {
      mockHTTPAdapter = MockHTTPAdapter();
      productService = ProductService(httpAdapter: mockHTTPAdapter);
    });

    test('getAllProducts returns list of ProductModel on success', () async {
      final List<dynamic> mockProductsData = [
        {
          'id': 1,
          'title': 'Product 1',
          'price': 100.0,
          'description': 'Description 1',
          'category': 'Category 1',
          'image': 'https://example.com/product1.jpg',
          'rating': {
            'rate': 1,
            'count': 2,
          }
        },
        {
          'id': 2,
          'title': 'Product 2',
          'price': 200.0,
          'description': 'Description 2',
          'category': 'Category 2',
          'image': 'https://example.com/product2.jpg',
          'rating': {
            'rate': 1,
            'count': 2,
          }
        }
      ];

      mockHTTPAdapter.mockGetResponse = mockProductsData;

      final result = await productService.getAllProducts();

      result.when(
        (leftValue) {
          expect(leftValue, isNotNull);
          expect(leftValue.length, 2);
          expect(leftValue[0].title, 'Product 1');
          expect(leftValue[1].title, 'Product 2');
        },
        (rightValue) {
          fail('Expected a Left result but got a Right with value $rightValue');
        },
      );
    });

    test('getAllProducts handles error correctly', () async {
      final result = await productService.getAllProducts();

      result.when(
        (leftValue) {
          fail('Expected a Right result but got a Left with value $leftValue');
        },
        (rightValue) {
          expect(rightValue, 500);
        },
      );
    });

    test('getProductsByCategory returns list of ProductModel on success',
        () async {
      final List<dynamic> mockProductsData = [
        {
          'id': 1,
          'title': 'Product 1',
          'price': 100.0,
          'description': 'Description 1',
          'category': 'Category 1',
          'image': 'https://example.com/product1.jpg',
          'rating': {
            'rate': 1,
            'count': 2,
          }
        }
      ];

      mockHTTPAdapter.mockGetResponse = mockProductsData;

      final result =
          await productService.getProductsByCategory(category: 'Category 1');

      result.when(
        (leftValue) {
          expect(leftValue, isNotNull);
          expect(leftValue.length, 1);
          expect(leftValue[0].title, 'Product 1');
        },
        (rightValue) {
          fail('Expected a Left result but got a Right with value $rightValue');
        },
      );
    });

    test('getProductsByCategory handles error correctly', () async {
      final result =
          await productService.getProductsByCategory(category: 'Category 1');

      result.when(
        (leftValue) {
          fail('Expected a Right result but got a Left with value $leftValue');
        },
        (rightValue) {
          expect(rightValue, 500);
        },
      );
    });
  });
}
