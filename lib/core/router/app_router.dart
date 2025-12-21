import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../storage/local_storage.dart';
import 'route_names.dart';
import '../../features/onboarding/view/get_started_page.dart';
import '../../features/onboarding/view/onboarding_page.dart';
import '../../features/paywall/view/paywall_page.dart';
import '../../features/home/view/home_page.dart';

class AppRouter {
  final LocalStorage _localStorage;
  late final GoRouter router;

  AppRouter(this._localStorage) {
    router = GoRouter(
      initialLocation: _getInitialRoute(),
      debugLogDiagnostics: true,
      routes: [
        // Get Started
        GoRoute(path: RouteNames.getStarted, name: 'getStarted', builder: (context, state) => const GetStartedPage()),
        // Onboarding
        GoRoute(path: RouteNames.onboarding, name: 'onboarding', builder: (context, state) => const OnboardingPage()),
        // Paywall
        GoRoute(path: RouteNames.paywall, name: 'paywall', builder: (context, state) => const PaywallPage()),
        // Home
        GoRoute(path: RouteNames.home, name: 'home', builder: (context, state) => const HomePage()),
      ],
    );
  }

  String _getInitialRoute() {
    return _localStorage.isOnboardingCompleted ? RouteNames.home : RouteNames.getStarted;
  }
}
