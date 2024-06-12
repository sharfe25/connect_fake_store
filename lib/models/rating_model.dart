/// A model class representing a rating.
class RatingModel {
  /// The average rating score.
  final num rate;

  /// The number of ratings.
  final num count;

  /// Creates a new [RatingModel] instance.
  ///
  /// The [rate] and [count] parameters are required.
  const RatingModel({
    required this.rate,
    required this.count,
  });

  /// Creates a [RatingModel] instance from a JSON object.
  ///
  /// The [json] parameter is a map representing the JSON object.
  ///
  /// Returns a [RatingModel] instance.
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: (json['rate'] ?? 0) as num,
      count: (json['count'] ?? 0) as num,
    );
  }

  /// Creates an empty [RatingModel] instance with default values.
  ///
  /// Returns a [RatingModel] instance with default values.
  factory RatingModel.empty() {
    return const RatingModel(
      rate: 0,
      count: 0,
    );
  }
}
