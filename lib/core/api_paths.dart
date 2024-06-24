import '../env/api_env.dart';

/// A utility class for constructing API paths.
class ApiPaths {
  /// The endpoint for fetching categories.
  static String categories = 'products/categories';

  /// The endpoint for fetching products.
  static String products = 'products';

  /// The endpoint for fetching products by category.
  static String productsByCategory = 'products/category/';

  /// Constructs a full URL given a specific API path and optional path variables.
  ///
  /// The [path] parameter specifies the API endpoint.
  /// The [pathVariables] parameter specifies additional variables to be appended
  /// to the path. It defaults to an empty string.
  ///
  /// Returns the complete URL as a string.
  static String createUrl({required String path, String pathVariables = ''}) {
    String baseUrl = apiEnv.apiUrl;
    return '$baseUrl$path$pathVariables';
  }
}
