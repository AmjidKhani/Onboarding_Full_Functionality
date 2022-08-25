import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboardingscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
      actions: [
        IconButton(onPressed: ()async{
          final prefs= await SharedPreferences.getInstance();
          prefs.setBool("showHome", false);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context)=>onboardingscreen()
              ),
          );
        },
            icon: Icon(Icons.logout))
      ],
      ),
    );
  }
}
