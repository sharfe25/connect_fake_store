class APIEnvModel {
  APIEnvModel({
    required String apiUrl,
  }){
    _apiUrl = apiUrl;
  }
  late String _apiUrl;

  String get apiUrl => _apiUrl;
}
