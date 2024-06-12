import 'dart:convert';
import 'dart:io';

import 'either.dart';

/// A singleton class for handling HTTP requests.
class HTTPAdapter {
  // Private constructor to prevent external instantiation.
  HTTPAdapter._();

  // The single instance of the class.
  static final HTTPAdapter _instance = HTTPAdapter._();

  // Method to get the single instance of the class.
  static HTTPAdapter getInstance() => _instance;

  // Constants for HTTP methods.
  static const String methodGet = 'GET';
  static const String methodPost = 'POST';
  static const String methodPut = 'PUT';

  /// Sends a GET request.
  ///
  /// [url] is the endpoint URL.
  /// [queryParameters] are the query parameters for the GET request.
  /// [headers] are the headers for the GET request.
  static Future<Either<T?, int>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    return dynamicRequest<T>(
      method: HTTPAdapter.methodGet,
      url: url,
      body: queryParameters,
      addHeaders: headers,
    );
  }

  /// Sends a dynamic HTTP request.
  ///
  /// [method] is the HTTP method (GET, POST, PUT, etc.).
  /// [url] is the endpoint URL.
  /// [body] is the body of the request (for POST, PUT, etc.).
  /// [addHeaders] are additional headers for the request.
  static Future<Either<T?, int>> dynamicRequest<T>({
    required String method,
    required String url,
    dynamic body,
    Map<String, String>? addHeaders,
  }) async {
    final HttpClient httpClient = HttpClient();
    try {
      final Uri urlParse = Uri.parse(url);

      if (body != null && method == HTTPAdapter.methodGet) {
        urlParse.replace(queryParameters: body as Map<String, dynamic>);
      }

      try {
        final HttpClientRequest request = await httpClient.getUrl(urlParse);
        if (addHeaders != null) {
          addHeaders.forEach((key, value) {
            request.headers.add(key, value);
          });
        }

        if (body != null && method != HTTPAdapter.methodGet) {
          request.write(jsonEncode(body));
        }

        final HttpClientResponse response = await request.close();
        return getResponse<T>(response);
      } catch (e) {
        if (e is SocketException) {
          return Right<T?, int>(e.osError?.errorCode ?? -1);
        }
        return Right<T?, int>(-1);
      }
    } finally {
      httpClient.close();
    }
  }

  /// Processes the HTTP response.
  ///
  /// [response] is the HTTP response.
  static Future<Either<T?, int>> getResponse<T>(
      HttpClientResponse response) async {
    if (response.statusCode.toString().startsWith('2')) {
      final String responseBodyString =
          await response.transform(utf8.decoder).join();
      if (responseBodyString.isEmpty) {
        return Left<T?, int>(null);
      }

      final dynamic responseBody = jsonDecode(responseBodyString);
      return Left<T?, int>(responseBody as T?);
    } else {
      return Right<T?, int>(response.statusCode);
    }
  }
}
