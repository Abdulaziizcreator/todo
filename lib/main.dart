import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/bottom_nav_bar_page.dart';
import 'package:todo/pages/home_page.dart';
import 'package:todo/pages/splash_page.dart';

void main() async {
  await Hive.initFlutter();
  var box =  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const SplashPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        BottomNavBarPage.id: (context) => const BottomNavBarPage(),
      },
    );
  }
}
