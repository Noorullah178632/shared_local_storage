import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nextfile extends StatefulWidget {
  const Nextfile({super.key});

  @override
  State<Nextfile> createState() => _NextfileState();
}

class _NextfileState extends State<Nextfile> {
  String? name;
  int? age;
  double? height;
  bool? isLoggedIn;
  //initstate
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name :$name"),
            Text("Age :$age"),
            Text("height :$height"),
            Text("Logged in :$isLoggedIn"),
          ],
        ),
      ),
    );
  }

  //now how to get that data
  Future<void> getData() async {
    final pref = await SharedPreferences.getInstance();
    name = pref.getString("userName") ?? "";
    age = pref.getInt("age") ?? 0;
    height = pref.getDouble("height") ?? 0.0;
    isLoggedIn = pref.getBool("isLogged") ?? false;

    setState(() {});
  }
}
