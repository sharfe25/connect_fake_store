import 'package:connect_fake_store/core/either.dart';
import 'package:connect_fake_store/core/http_adapter.dart';

class MockHTTPAdapter extends HTTPAdapter {
  dynamic mockGetResponse;

  @override
  Future<Either<T?, int>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    if (mockGetResponse != null) {
      return Left<T?, int>(mockGetResponse as T?);
    }
    return Right<T?, int>(500);
  }
}