import 'package:connect_fake_store/core/either.dart';
import 'package:connect_fake_store/models/category_model.dart';
import 'package:connect_fake_store/services/category_service.dart';

class MockCategoryService extends CategoryService {
  MockCategoryService({required super.httpAdapter});

  @override
  Future<Either<List<CategoryModel>, int>> getAllCategories() async {
    return Left<List<CategoryModel>, int>([CategoryModel(name: 'Test Category')]);
  }
}

class MockErrorCategoryService extends CategoryService {
  MockErrorCategoryService({required super.httpAdapter});

  @override
  Future<Either<List<CategoryModel>, int>> getAllCategories() async {
    return Right<List<CategoryModel>, int>(400);
  }
}