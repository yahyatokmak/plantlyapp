import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/storage/local_storage.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/snack.dart';
import 'core/network/dio_client.dart';

class PlantApp extends StatelessWidget {
  final LocalStorage localStorage;
  final DioClient dioClient;
  final AppRouter appRouter;

  const PlantApp({
    super.key,
    required this.localStorage,
    required this.dioClient,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: localStorage),
        RepositoryProvider.value(value: dioClient),
      ],
      child: MaterialApp.router(
        title: 'PlantApp',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        routerConfig: appRouter.router,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}
