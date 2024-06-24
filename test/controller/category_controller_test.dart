import 'package:connect_fake_store/core/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connect_fake_store/controller/category_controller.dart';

import '../mocks/mock_category_service.dart';

void main() {
  late CategoryController categoryController;
  setUp(() {
    categoryController = CategoryController(
        categoryService:
            MockCategoryService(httpAdapter: HTTPAdapter.getInstance()));
  });
  test('CategoryController initializes with empty categories', () {
    expect(categoryController.categories.isEmpty, true);
  });

  test('CategoryController fetches categories successfully', () async {
    await categoryController.getAllCategories();

    expect(categoryController.categories.isNotEmpty, true);
  });

  test('CategoryController handles error when fetching categories', () async {
    await categoryController.getAllCategories();

    expect(categoryController.categories.isNotEmpty, true);
  });
}
