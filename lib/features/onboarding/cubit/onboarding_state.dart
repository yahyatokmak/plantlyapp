import 'package:flutter/foundation.dart';

@immutable
class OnboardingState {
  final int currentPage;
  final int totalPages;

  const OnboardingState({
    this.currentPage = 0,
    this.totalPages = 2,
  });

  OnboardingState copyWith({
    int? currentPage,
    int? totalPages,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  bool get isLastPage => currentPage == totalPages - 1;
}
