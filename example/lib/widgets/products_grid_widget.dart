import 'package:connect_fake_store/models/product_model.dart';
import 'package:flutter/material.dart';

import 'product_card_widget.dart';

/// A widget that displays a grid of products with a title.
///
/// The [ProductsGrid] widget arranges the given list of products in a grid layout,
/// with each product displayed as a card. It also includes a title above the grid.
class ProductsGrid extends StatelessWidget {
  /// The title to be displayed above the grid.
  final String title;

  /// The list of products to be displayed in the grid.
  final List<ProductModel> products;

  /// Creates a [ProductsGrid].
  ///
  /// The [title] and [products] parameters are required.
  const ProductsGrid({Key? key, required this.title, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the title text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF797780),
              ),
            ),
          ),
          // Display the grid of product cards
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 8),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: 1 / 1.5,
            ),
            itemBuilder: (context, index) {
              return ProductCard(product: products[index]);
            },
          ),
        ],
      ),
    );
  }
}
