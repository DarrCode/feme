import 'package:feme/screens/home_screen.dart';
import 'package:feme/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:feme/providers/api_provider.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen(), routes: [
      GoRoute(
        path: 'profile',
        builder: (context, state) => const ProfileScreen(),
      )
    ])
  ],
);

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApiProvider(),
      child: MaterialApp.router(
          title: 'FEME App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(brightness: Brightness.dark),
          routerConfig: _router),
    );
  }
}
