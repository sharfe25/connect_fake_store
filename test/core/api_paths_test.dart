import 'package:flutter_test/flutter_test.dart';
import 'package:connect_fake_store/core/api_paths.dart';

void main() {
  group('ApiPaths', () {
    test('createUrl constructs correct URL without path variables', () {
      const path = 'products';
      const expectedUrl = 'https://fakestoreapi.com/products';

      final result = ApiPaths.createUrl(path: path);

      expect(result, expectedUrl);
    });

    test('createUrl constructs correct URL with path variables', () {
      const path = 'products/category/';
      const pathVariables = 'electronics';
      const expectedUrl = 'https://fakestoreapi.com/products/category/electronics';

      final result =
          ApiPaths.createUrl(path: path, pathVariables: pathVariables);

      expect(result, expectedUrl);
    });
  });
}
