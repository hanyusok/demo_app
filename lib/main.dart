import 'package:demo_app/screens/home_page.dart';
import 'package:demo_app/screens/page_four.dart';
import 'package:demo_app/screens/page_one.dart';
import 'package:demo_app/screens/page_three.dart';
import 'package:demo_app/screens/page_two.dart';
import 'package:demo_app/screens/subone_page.dart';
import 'package:demo_app/screens/subthree_page.dart';
import 'package:demo_app/screens/subtwo_page.dart';
import 'package:demo_app/screens/user_detail_page.dart';
import 'package:demo_app/screens/users_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/userspage',
      name: 'userspage',
      builder: (context, state) => const UsersPage()),
  GoRoute(
      path: '/userdetail',
      name: 'userdetail',
      builder: (context, state) =>
          // const UserDetailPage(id: state.pathParameters['userId'])
          const UserDetailPage()),
  GoRoute(path: '/', builder: (context, state) => const HomePage(), routes: [
    GoRoute(
        path: 'subonepage', builder: (context, state) => const SubonePage()),
    GoRoute(
        path: 'subtwopage', builder: (context, state) => const SubtwoPage()),
    GoRoute(
        path: 'subthreepage',
        builder: (context, state) => const SubthreePage()),
  ]),
  GoRoute(
      path: '/pageone',
      name: 'pageone',
      builder: (context, state) => const PageOne()),
  GoRoute(
      path: '/pagetwo',
      name: 'pagetwo',
      builder: (context, state) => const PageTwo()),
  GoRoute(
      path: '/pagethree',
      name: 'pagethree',
      builder: (context, state) => const PageThree()),
  GoRoute(
      path: '/pagefour',
      name: 'pagefour',
      builder: (context, state) => const PageFour()),
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
