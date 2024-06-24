import 'package:connect_fake_store/services/category_service.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mock_http_adapter.dart';



void main() {
  group('CategoryService', () {
    late CategoryService categoryService;
    late MockHTTPAdapter mockHTTPAdapter;
    final List<dynamic> mockCategoriesData = [
        'Electronics',
        'Clothing',
        'Books'
      ];

    setUp(() {
      mockHTTPAdapter = MockHTTPAdapter();
      categoryService = CategoryService(httpAdapter: mockHTTPAdapter);
    });

    test('getAllCategories returns list of CategoryModel on success', () async {
      

      mockHTTPAdapter.mockGetResponse = mockCategoriesData;

      final result = await categoryService.getAllCategories();

      result.when(
        (leftValue) {
          expect(leftValue, isNotNull);
          expect(leftValue.length, 3); 
          expect(leftValue[0].name, 'Electronics');
          expect(leftValue[1].name, 'Clothing');
          expect(leftValue[2].name, 'Books');
        },
        (rightValue) {
          fail('Expected a Left result but got a Right with value $rightValue');
        },
      );
    });

    test('getAllCategories handles error correctly', () async {
      final result = await categoryService.getAllCategories();

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
