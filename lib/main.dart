import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/api/api_service.dart';
import 'app_router.dart';
import 'ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<ApiService>(
      create: (_) => ApiService(),
      child: MaterialApp.router(
        title: 'Ricksy',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
      ),

    );
  }
}