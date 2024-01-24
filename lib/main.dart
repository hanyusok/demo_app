import 'package:demo_app/screens/home_page.dart';
import 'package:demo_app/firebase_options.dart';
import 'package:demo_app/screens/logins/login_page.dart';
import 'package:demo_app/screens/page_four.dart';
import 'package:demo_app/screens/page_one.dart';
import 'package:demo_app/screens/page_three.dart';
import 'package:demo_app/screens/page_two.dart';
import 'package:demo_app/screens/subone_page.dart';
import 'package:demo_app/screens/subthree_page.dart';
import 'package:demo_app/screens/subtwo_page.dart';
import 'package:demo_app/screens/user_detail_page.dart';
import 'package:demo_app/screens/users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

// import 'package:demo_app/themes/custom_theme.dart';

// late final FirebaseApp app;
// late final FirebaseAuth auth;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ThemeMode _themeMode = CustomTheme.themeMode; /* custom setting*/
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User? user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?> {
        Stream: FirebaseAuth.instance.authStateChanges(),
        Builder: (context, AsyncSnapshot<User?> snapshot){
          if(snapshot.hasData && snapshot.data!=null){
            return const HomePage();
          } 
          else if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator());           
          }
        return const LoginPage();
      }},
      routes: {
        '/homepage': (context) => const HomePage(),
        '/': (context) => const LoginPage(),
        '/userspage': (context) => const UsersPage(),
        '/userdetailpage': (context) => const UserDetailPage(),
        '/subonepage': (context) => const SubonePage(),
        '/subtwopage': (context) => const SubtwoPage(),
        '/subthreepage': (context) => const SubthreePage(),
        '/pagefour': (context) => const PageFour(),
        '/pageOne': (context) => const PageOne(),
        '/pageThree': (context) => const PageThree(),
        '/pageTwo': (context) => const PageTwo(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,      

    );
  }
}

