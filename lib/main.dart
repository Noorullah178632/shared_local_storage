import 'package:flutter/material.dart';
import 'package:shared_local_data/nextfile.dart';
import 'package:shared_local_data/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: FutureBuilder(
        future: decidedStartScreen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return snapshot.data!;
        },
      ),
    );
  }

  //make a funtion for future builder to get the shared pref data
  Future<Widget> decidedStartScreen() async {
    final pref = await SharedPreferences.getInstance();
    final p = pref.getString("userName");
    if (p != null && p.isNotEmpty) {
      return Nextfile();
    }
    return SimpleForm();
  }
}
