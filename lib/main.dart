import 'package:api_berita_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ITG Consume API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationProvider: AppRoutes.goRouter.routeInformationProvider,
      routerDelegate: AppRoutes.goRouter.routerDelegate,
    );
  }
}
