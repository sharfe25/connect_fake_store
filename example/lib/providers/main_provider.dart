import 'package:connect_fake_store/connect_fake_store.dart';
import 'package:connect_fake_store/models/category_model.dart';
import 'package:connect_fake_store/models/product_model.dart';
import 'package:flutter/material.dart';

import '../pages/categories_page.dart';
import '../pages/products_page.dart';

class MainProvider with ChangeNotifier {
  bool _isLoading = false;
  String _allProducts = '';
  String _allCategories = '';
  final ConnectFakeStore _connectFakeStore = ConnectFakeStore();

  bool get isLoading => _isLoading;
  String get allProducts => _allProducts;
  String get allCategories => _allCategories;

  Future<void> getAllCategories({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await _connectFakeStore.categoryController.getAllCategories();
    
    final List<CategoryModel> categories =
        _connectFakeStore.categoryController.categories;
    _allCategories = '';
    _allCategories = '[\n';
    for (int i = 0; i < categories.length; i++) {
      _allCategories += '  ${categories[i]}\n';
      if (i != categories.length - 1) {
        _allCategories += ',\n';
      }
    }
    _allCategories += ']';
    if (context.mounted) {
      Navigator.push(
          context,
          (MaterialPageRoute(
              builder: (context) => CategoriesPage(
                    provider: this,
                  ))));
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllProducts({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();

    await _connectFakeStore.productController.getAllProducts();
    final List<ProductModel> products =
        _connectFakeStore.productController.products;
    _allProducts = '';
    _allProducts = '[\n';
    for (int i = 0; i < products.length; i++) {
      _allProducts += '  ${products[i]}\n';
      if (i != products.length - 1) {
        _allProducts += ',\n';
      }
    }
    _allProducts += ']';
    if (context.mounted) {
      Navigator.push(
          context,
          (MaterialPageRoute(
              builder: (context) => ProductsPage(
                    provider: this,
                  ))));
    }
    _isLoading = false;
    notifyListeners();
  }
}
