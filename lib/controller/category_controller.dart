import '../core/either.dart';
import '../models/category_model.dart';
import '../services/category_service.dart';

/// A controller that manages categories by interacting with the [CategoryService].
class CategoryController {
  /// Private list of categories.
  List<CategoryModel> _categories = [];

  /// The service responsible for fetching categories.
  final CategoryService _categoryService;

  /// Creates a [CategoryController] with the given [CategoryService].
  ///
  /// The [categoryService] parameter is required.
  CategoryController({required CategoryService categoryService})
      : _categoryService = categoryService;

  /// Gets the current list of categories.
  List<CategoryModel> get categories => _categories;

  /// Fetches all categories from the [CategoryService].
  ///
  /// This method makes an asynchronous call to [CategoryService.getAllCategories]
  /// and updates the [_categories] list if successful. In case of an error,
  /// it prints the error code to the console.
  Future<void> getAllCategories() async {
    final Either<List<CategoryModel>, int> result =
        await _categoryService.getAllCategories();
    result.when((List<CategoryModel> left) {
      _categories = left;
    }, (int right) async {
      _categories = [];
    });
  }
}
