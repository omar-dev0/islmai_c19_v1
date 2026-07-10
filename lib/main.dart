import 'package:flutter/material.dart';
import 'package:islami_friday/core/cache_helper.dart';
import 'package:islami_friday/features/home/home.dart';
import 'package:islami_friday/features/sura_details/sura_details_screen.dart';
import 'package:islami_friday/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //comment

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Home.homeRoute,
      routes: {
        OnBoardingScreen.route: (_) => OnBoardingScreen(),
        Home.homeRoute: (_) => Home(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
      },
    );
  }
}

//core | utils
// features
