import '../models/category.dart';
import '../models/question.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState {
  final HomeStatus status;
  final List<Category> categories;
  final List<Question> questions;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.categories = const [],
    this.questions = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<Category>? categories,
    List<Question>? questions,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      questions: questions ?? this.questions,
      errorMessage: errorMessage,
    );
  }
}
