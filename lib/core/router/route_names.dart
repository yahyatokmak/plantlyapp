enum AppRoute {
  getStarted(path: '/', name: 'get_started'),
  onboarding(path: '/onboarding', name: 'onboarding'),
  paywall(path: '/paywall', name: 'paywall'),
  home(path: '/home', name: 'home');

  final String path;
  final String name;

  const AppRoute({required this.path, required this.name});
}
