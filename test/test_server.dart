import 'dart:io';
import 'dart:convert';

void main() async {
  final server = await HttpServer.bind('localhost', 8080);

  await for (var request in server) {
    if (request.method == 'GET' && request.uri.path == '/api/products') {
      request.response
        ..statusCode = 200
        ..headers.contentType = ContentType.json
        ..write(jsonEncode([{'id': 1, 'name': 'Product 1'}, {'id': 2, 'name': 'Product 2'}]));
    } else if (request.method == 'GET' && request.uri.path == '/api/products/404') {
      request.response
        ..statusCode = 404
        ..write('Not Found');
    } else {
      request.response
        ..statusCode = 404
        ..write('Not Found');
    }
    await request.response.close();
  }
}
