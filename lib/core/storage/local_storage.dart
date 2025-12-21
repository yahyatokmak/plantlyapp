import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _keyOnboardingCompleted = 'onboarding_completed';

  final SharedPreferences _prefs;

  LocalStorage(this._prefs);

  // Onboarding
  bool get isOnboardingCompleted => _prefs.getBool(_keyOnboardingCompleted) ?? false;

  Future<void> setOnboardingCompleted() async {
    await _prefs.setBool(_keyOnboardingCompleted, true);
  }

  Future<void> clearOnboarding() async {
    await _prefs.remove(_keyOnboardingCompleted);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}
