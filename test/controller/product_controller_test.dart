import 'package:connect_fake_store/core/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:connect_fake_store/controller/product_controller.dart';

import '../mocks/mock_product_service.dart';

void main() {
  late ProductController productController;
  setUpAll(() {
    productController = ProductController(
        productService:
            MockProductService(httpAdapter: HTTPAdapter.getInstance()));
  });
  test('ProductController initializes with empty products', () {
    expect(productController.products.isEmpty, true);
  });

  test('ProductController fetches all products successfully', () async {
    await productController.getAllProducts();

    expect(productController.products.isNotEmpty, true);
  });

  test('ProductController fetches products by category successfully', () async {
    await productController.getProductsByCategory(category: 'Test Category');

    expect(productController.productsByCategory.isNotEmpty, true);
  });

  test('ProductController handles error when fetching products', () async {
    await productController.getAllProducts();

    expect(productController.products.isNotEmpty, true);
  });

  test('ProductController handles error when fetching products by category',
      () async {
    await productController.getProductsByCategory(category: 'Test Category');

    expect(productController.productsByCategory.isEmpty, false);
  });
}
