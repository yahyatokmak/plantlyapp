import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'core/network/dio_client.dart';
import 'core/storage/local_storage.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final localStorage = LocalStorage(prefs);

  // Initialize network client
  final dioClient = DioClient();

  // Initialize router
  final appRouter = AppRouter(localStorage);

  runApp(PlantApp(localStorage: localStorage, dioClient: dioClient, appRouter: appRouter));
}
