import 'dart:convert';
import '../../../core/constants/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../models/category.dart';
import '../models/question.dart';

class HomeRepository {
  final DioClient _dioClient;

  HomeRepository(this._dioClient);

  dynamic _parseResponse(dynamic data) {
    if (data is String) {
      return jsonDecode(data);
    }
    return data;
  }

  Future<List<Category>> getCategories() async {
    final response = await _dioClient.get<dynamic>(ApiConstants.categories);
    final responseData = _parseResponse(response.data);

    if (responseData is! Map<String, dynamic>) {
      throw Exception('Invalid categories response format');
    }

    final categoriesResponse = CategoriesResponse.fromJson(responseData);
    final categories = List<Category>.from(categoriesResponse.data);
    categories.sort((a, b) => a.rank.compareTo(b.rank));
    return categories;
  }

  Future<List<Question>> getQuestions() async {
    final response = await _dioClient.get<dynamic>(ApiConstants.questions);
    final responseData = _parseResponse(response.data);

    if (responseData is! List) {
      throw Exception('Invalid questions response format');
    }

    final questions = responseData
        .map((json) => Question.fromJson(json as Map<String, dynamic>))
        .toList();
    questions.sort((a, b) => a.order.compareTo(b.order));
    return questions;
  }
}
