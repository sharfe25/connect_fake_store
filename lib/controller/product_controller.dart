import 'package:flutter/material.dart';
import '../core/either.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

/// A controller that manages products by interacting with the [ProductService].
class ProductController {
  /// Private list of all products.
  List<ProductModel> _products = [];

  /// Private list of products filtered by category.
  List<ProductModel> _productsByCategory = [];

  /// Private title representing the current category of products.
  String? _titleProductsByCategory;

  /// The service responsible for fetching products.
  final ProductService _productService;

  /// Creates a [ProductController] with the given [ProductService].
  ///
  /// The [productService] parameter is required.
  ProductController({required ProductService productService})
      : _productService = productService;

  /// Gets the current list of all products.
  List<ProductModel> get products => _products;

  /// Gets the current list of products filtered by category.
  List<ProductModel> get productsByCategory => _productsByCategory;

  /// Gets the title of the current category of products.
  String? get titleProductsByCategory => _titleProductsByCategory;

  /// Fetches all products from the [ProductService].
  ///
  /// This method makes an asynchronous call to [ProductService.getAllProducts]
  /// and updates the [_products] list if successful. In case of an error,
  /// it prints the error code to the console.
  Future<void> getAllProducts() async {
    final Either<List<ProductModel>, int> result =
        await _productService.getAllProducts();
    result.when((List<ProductModel> left) {
      _products = left;
    }, (int right) async {
      _products = [];
    });
  }

  /// Fetches products by category from the [ProductService].
  ///
  /// This method makes an asynchronous call to [ProductService.getProductsByCategory]
  /// and updates the [_productsByCategory] list if successful. It also sets the
  /// [_titleProductsByCategory] to the given category. If successful, it navigates
  /// to the '/products_by_category' route. In case of an error, it prints the error
  /// code to the console.
  ///
  /// The [category] parameter specifies the category to filter products by.
  Future<void> getProductsByCategory({
    required String category,
  }) async {
    _titleProductsByCategory = category;
    final Either<List<ProductModel>, int> result =
        await _productService.getProductsByCategory(category: category);
    result.when((List<ProductModel> left) {
      _productsByCategory = left;
    }, (int right) async {
      _products = [];
    });
  }
}
