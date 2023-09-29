import 'package:demo_flutter_app/screens/home_page.dart';
import 'package:demo_flutter_app/screens/second_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

var myAppRouter = GoRouter(routes: <RouteBase>[
  GoRoute(
    name: 'home',
    path: '/',
    builder: (context, state) => MyHomePage(title: "Title"),
  ),
  GoRoute(
      name: 'second',
      path: '/second',
      builder: (context, state) => SecondPage())
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      routerConfig: myAppRouter,
    );
  }
}

