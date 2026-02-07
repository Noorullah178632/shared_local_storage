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

  //initstate
  @override
  void initState() {
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await clearData();
        },
        child: Text("Clear"),
      ),
    );
  }

  Future<void> clearData() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    name = null;
    age = null;
    height = null;
    // islogged = null;

    setState(() {});
  }

  //now how to get that data
  Future<void> getData() async {
    final pref = await SharedPreferences.getInstance();
    name = pref.getString("userName") ?? "";
    age = pref.getInt("age") ?? 0;
    height = pref.getDouble("height") ?? 0.0;

    setState(() {});
  }
}
