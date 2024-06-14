import 'package:flutter/material.dart';

import '../providers/main_provider.dart';

class ProductsPage extends StatelessWidget {
  final MainProvider provider;
  const ProductsPage({Key? key, required this.provider}) : super(key: key);

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
          child: Text(
            provider.allProducts,
          ),
        ),
      ),
    );
  }
}
