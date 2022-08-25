import 'package:flutter/material.dart';
import 'package:onboardingscreen/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboardingscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs=await SharedPreferences.getInstance();
  final showHome=prefs.getBool("showHome")??false;
  runApp(MyApp(showHome:showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this. showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:showHome?HomePage(): onboardingscreen(),
    );
  }
}

