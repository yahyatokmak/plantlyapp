import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/api_exception.dart';
import '../data/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit(this._repository) : super(const HomeState());

  Future<void> loadData() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final categoriesFuture = _repository.getCategories();
      final questionsFuture = _repository.getQuestions();

      final categories = await categoriesFuture;
      final questions = await questionsFuture;

      emit(state.copyWith(
        status: HomeStatus.success,
        categories: categories,
        questions: questions,
      ));
    } on ApiException catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: 'An unexpected error occurred',
      ));
    }
  }
}
