import '../core/api_paths.dart';
import '../core/either.dart';
import '../core/http_adapter.dart';
import '../models/category_model.dart';

class CategoryService {
  final HTTPAdapter httpAdapter;

  CategoryService({required this.httpAdapter});

  Future<Either<List<CategoryModel>, int>> getAllCategories() async {
    final dynamic serviceUrl = ApiPaths.createUrl(
      path: ApiPaths.categories,
    );

    final Either<List<dynamic>?, int> result = await httpAdapter.get<List<dynamic>>(
      url: serviceUrl,
    );

    return result.when(
      (List<dynamic>? leftValue) {
        if (leftValue == null) {
          return Right<List<CategoryModel>, int>(400);
        }
        List<CategoryModel> categories = [];
        for (final dynamic element in leftValue) {
          final categoryModel = CategoryModel(
            name: element.toString(),
          );
          categories.add(categoryModel);
        }
        return Left<List<CategoryModel>, int>(categories);
      },
      (int rightValue) => Right<List<CategoryModel>, int>(rightValue),
    );
  }
}
