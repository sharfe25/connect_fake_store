library connect_fake_store;

import 'package:connect_fake_store/controller/category_controller.dart';
import 'package:connect_fake_store/services/category_service.dart';
import 'controller/product_controller.dart';
import 'services/product_service.dart';

/// A library that provides controllers for interacting with a fake store's products and categories.
class ConnectFakeStore {
  /// The controller responsible for handling product-related operations.
  final ProductController productController =
      ProductController(productService: ProductService());

  /// The controller responsible for handling category-related operations.
  final CategoryController categoryController =
      CategoryController(categoryService: CategoryService());
}
