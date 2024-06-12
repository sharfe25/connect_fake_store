import 'package:connect_fake_store/models/product_model.dart';
import 'package:flutter/material.dart';

import '../widgets/products_grid_widget.dart';

class ProductsPage extends StatelessWidget {
  final List<ProductModel> products;
  const ProductsPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: ProductsGrid(
            title: '',
            // Retrieve products using the product provider
            products: products,
          ),
        ),
      ),
    );
  }
}
