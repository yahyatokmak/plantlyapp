import 'package:go_router/go_router.dart';
import '../storage/local_storage.dart';
import 'route_names.dart';
import '../../features/home/view/home_page.dart';
import '../../features/onboarding/view/get_started_page.dart';
import '../../features/onboarding/view/onboarding_page.dart';
import '../../features/paywall/view/paywall_page.dart';

class AppRouter {
  final LocalStorage _localStorage;
  late final GoRouter router;

  AppRouter(this._localStorage) {
    router = GoRouter(
      initialLocation: _getInitialRoute(),
      debugLogDiagnostics: true,
      routes: [
        GoRoute(path: AppRoute.getStarted.path, name: AppRoute.getStarted.name, builder: (context, state) => const GetStartedPage()),
        GoRoute(path: AppRoute.onboarding.path, name: AppRoute.onboarding.name, builder: (context, state) => const OnboardingPage()),
        GoRoute(path: AppRoute.paywall.path, name: AppRoute.paywall.name, builder: (context, state) => const PaywallPage()),
        GoRoute(path: AppRoute.home.path, name: AppRoute.home.name, builder: (context, state) => const HomePage()),
      ],
    );
  }

  String _getInitialRoute() {
    return _localStorage.isOnboardingCompleted ? AppRoute.home.path : AppRoute.getStarted.path;
  }
}
