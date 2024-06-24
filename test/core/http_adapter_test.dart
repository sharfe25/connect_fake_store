import 'package:connect_fake_store/core/http_adapter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HTTPAdapter Integration Tests', () {
    late String serverUrl;
    late HTTPAdapter httpAdapter;

    setUpAll(() {
      serverUrl = 'http://localhost:8080/api';
      httpAdapter = HTTPAdapter.getInstance();
    });

    test('getting HTTPAdapter instance', () async {
      final httpInstance = HTTPAdapter.getInstance();

      expect(httpInstance, HTTPAdapter.getInstance());
    });

    test('HTTPAdapter sends a GET request successfully', () async {
      final url = '$serverUrl/products';

      final result = await httpAdapter.get(url: url);

      expect(
          result.when(
            (leftValue) => true,
            (rightValue) => false,
          ),
          true);
      expect(
          result.when(
            (leftValue) => leftValue.isNotEmpty,
            (rightValue) => false,
          ),
          true);
    });

    test('HTTPAdapter handles server error response', () async {
      final url = '$serverUrl/products/404';

      final result = await httpAdapter.get(url: url);

      expect(
          result.when(
            (leftValue) => false,
            (rightValue) => true,
          ),
          true);
      expect(
          result.when(
            (leftValue) => false,
            (rightValue) => rightValue == 404,
          ),
          true);
    });
  });
}
