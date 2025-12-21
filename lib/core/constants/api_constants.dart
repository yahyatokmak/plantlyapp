abstract final class ApiConstants {
  static const String baseUrl = 'https://dummy-api-jtg6bessta-ey.a.run.app';

  // Endpoints
  static const String categories = '/getCategories';
  static const String questions = '/getQuestions';

  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
}
