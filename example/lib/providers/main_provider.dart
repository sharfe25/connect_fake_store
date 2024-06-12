import 'package:connect_fake_store/connect_fake_store.dart';
import 'package:flutter/material.dart';

import '../pages/categories_page.dart';
import '../pages/products_page.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;
  final ConnectFakeStore _connectFakeStore = ConnectFakeStore();

  bool get isLoading => _isLoading;

  Future<void> getAllCategories({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await _connectFakeStore.categoryController.getAllCategories();
    if (context.mounted) {
      Navigator.push(
          context,
          (MaterialPageRoute(
              builder: (context) => CategoriesPage(
                    categories: _connectFakeStore.categoryController.categories,
                  ))));
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getAllProducts({required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    await _connectFakeStore.productController.getAllProducts();
    if (context.mounted) {
      Navigator.push(
          context,
          (MaterialPageRoute(
              builder: (context) => ProductsPage(
                    products: _connectFakeStore.productController.products,
                  ))));
    }
    _isLoading = false;
    notifyListeners();
  }
}
