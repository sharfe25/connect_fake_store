import 'package:connect_fake_store/models/rating_model.dart';

/// A model class representing a product.
class ProductModel {
  /// The unique identifier of the product.
  final num id;

  /// The title of the product.
  final String title;

  /// The URL of the product image.
  final String image;

  /// The category of the product.
  final String category;

  /// The description of the product.
  final String description;

  /// The price of the product.
  final num price;

  /// The rating of the product.
  final RatingModel rating;

  /// Creates a new [ProductModel] instance.
  ///
  /// The [id], [title], [image], [category], [description], [price], and [rating] parameters are required.
  const ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
  });

  /// Creates a [ProductModel] instance from a JSON object.
  ///
  /// The [json] parameter is a map representing the JSON object.
  ///
  /// Returns a [ProductModel] instance.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: (json['id'] ?? 0) as num,
      title: json['title'].toString(),
      image: json['image'].toString(),
      category: json['category'].toString(),
      description: json['description'].toString(),
      price: (json['price'] ?? 0) as num,
      rating: RatingModel.fromJson(json['rating']),
    );
  }

  /// Creates an empty [ProductModel] instance with default values.
  ///
  /// Returns a [ProductModel] instance with default values.
  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      title: '',
      image: '',
      category: '',
      description: '',
      price: 0,
      rating: RatingModel.empty(),
    );
  }

  /// Returns a string representation of the [ProductModel] instance.
  @override
  String toString() {
    return 'Product(id: $id, name: $title, price: $price)';
  }
}
