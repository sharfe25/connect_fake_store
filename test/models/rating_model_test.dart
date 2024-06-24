import 'package:connect_fake_store/models/rating_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Rating model test', () {
    test('Return a valid instance of the model', () {
      const RatingModel rating =
          RatingModel(rate: 3, count: 4);

      expect(rating.rate, equals(3));
      expect(rating.count, equals(4));
    });

    test('Return a valid instance of the model from json', () {
      final Map<String, dynamic> jsonMap = <String, dynamic>{
      'rate': 1,
      'count': 2,
    };
      final RatingModel rating =
          RatingModel.fromJson(jsonMap);

      expect(rating.rate, equals(1));
      expect(rating.count, equals(2));
    });

    test('Return a valid instance of the empty model', () {
      RatingModel rating = RatingModel.empty();

      expect(rating.rate, equals(0));
      expect(rating.count, equals(0));
    });
  });
}
