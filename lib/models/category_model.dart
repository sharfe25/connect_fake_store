/// A model class representing a category.
class CategoryModel {
  /// The name of the category.
  final String name;

  /// Creates a new [CategoryModel] instance.
  ///
  /// The [name] parameter is required.
  CategoryModel({
    required this.name,
  });

  /// Returns a string representation of the [CategoryModel] instance.
  @override
  String toString() {
    return 'Category(name: $name)';
  }
}
