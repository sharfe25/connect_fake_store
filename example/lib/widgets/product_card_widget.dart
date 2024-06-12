import 'package:connect_fake_store/models/product_model.dart';
import 'package:flutter/material.dart';

/// A widget that displays a product card with an image, title, and price.
///
/// The [ProductCard] is used to display product details in a card layout,
/// including the product image, title, and price.
class ProductCard extends StatelessWidget {
  /// The product data to be displayed.
  final ProductModel product;

  /// Creates a [ProductCard].
  ///
  /// The [product] parameter must not be null and is required.
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the product image
        Container(
          width: 200,
          height: 210,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(product.image),
            ),
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Display the product title
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            product.title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // Display the product price
        Expanded(
          child: Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
