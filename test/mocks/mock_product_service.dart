import 'package:connect_fake_store/core/either.dart';
import 'package:connect_fake_store/models/product_model.dart';
import 'package:connect_fake_store/services/product_service.dart';

class MockProductService extends ProductService {
  MockProductService({required super.httpAdapter});

  @override
  Future<Either<List<ProductModel>, int>> getAllProducts() async {
    return Left<List<ProductModel>, int>([ProductModel.empty()]);
  }

  @override
  Future<Either<List<ProductModel>, int>> getProductsByCategory({required String category}) async {
    return Left<List<ProductModel>, int>([ProductModel.empty()]);
  }
}

class MockErrorProductService extends ProductService {
  MockErrorProductService({required super.httpAdapter});

  @override
  Future<Either<List<ProductModel>, int>> getAllProducts() async {
    return Right<List<ProductModel>, int>(400);
  }

  @override
  Future<Either<List<ProductModel>, int>> getProductsByCategory({required String category}) async {
    return Right<List<ProductModel>, int>(400);
  }
}