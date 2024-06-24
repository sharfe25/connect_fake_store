import 'package:connect_fake_store/env/api_env.dart';
import 'package:connect_fake_store/env/api_env_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('APIEnvModel model test', () {
    test('Return a valid instance of the model', () {
      APIEnvModel env = APIEnvModel(apiUrl: 'url');

      expect(env.apiUrl, equals('url'));
    });

    test('App env model test', () {
      APIEnvModel env = apiEnv;

      expect(env.apiUrl, equals('https://fakestoreapi.com/'));
    });
  });
}
