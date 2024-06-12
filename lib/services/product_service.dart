
import '../core/api_paths.dart';
import '../core/either.dart';
import '../core/http_adapter.dart';
import '../models/product_model.dart';

class ProductService {
  Future<Either<List<ProductModel>, int>> getAllProducts() async {
    final dynamic serviceUrl = ApiPaths.createUrl(
      path: ApiPaths.products,
    );
    final Either<List<dynamic>?, int> result =
        await HTTPAdapter.get<List<dynamic>?>(
      url: serviceUrl,
    );

    return result.when((List<dynamic>? leftValue) {
      if (leftValue == null) {
        return Right<List<ProductModel>, int>(400);
      }
      List<ProductModel> products = [];
      for (final dynamic product in leftValue) {
        final producModel = ProductModel.fromJson(
          product as Map<String, dynamic>,
        );
        products.add(producModel);
      }
      return Left<List<ProductModel>, int>(
        products,
      );
    }, (int rightValue) {
      return Right<List<ProductModel>, int>(rightValue);
    });
  }

  Future<Either<List<ProductModel>, int>> getProductsByCategory(
      {required String category}) async {
    final dynamic serviceUrl = ApiPaths.createUrl(
        path: ApiPaths.productsByCategory, pathVariables: category);
    final Either<List<dynamic>?, int> result =
        await HTTPAdapter.get<List<dynamic>?>(
      url: serviceUrl,
    );

    return result.when((List<dynamic>? left) {
      if (left == null) {
        return Right<List<ProductModel>, int>(400);
      }
      List<ProductModel> products = [];
      for (final dynamic product in left) {
        final producModel = ProductModel.fromJson(
          product as Map<String, dynamic>,
        );
        products.add(producModel);
      }
      return Left<List<ProductModel>, int>(
        products,
      );
    }, (int right) {
      return Right<List<ProductModel>, int>(right);
    });
  }
}
