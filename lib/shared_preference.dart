import 'package:flutter/material.dart';
import 'package:shared_local_data/nextfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  // Controllers to capture text input
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final heightController = TextEditingController();
  bool isLoggedIn = false;
  //to get that data
  String? name;
  int? age;
  double? height;
  bool? islogged;
  //dispose method
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    ageController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Info Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Username Field (String)
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            // Age Field (int)
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            // Height Field (double)
            TextField(
              controller: heightController,
              decoration: const InputDecoration(labelText: 'Height (cm)'),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 20),
            // Is Logged In Toggle (bool)
            Row(
              children: [
                const Text("Is Logged In?"),
                Switch(
                  value: isLoggedIn,
                  onChanged: (val) => setState(() => isLoggedIn = val),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await saveData(
                  nameController.text,
                  int.parse(ageController.text),
                  double.parse(heightController.text),
                  isLoggedIn,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Nextfile()),
                );
                nameController.clear();
                ageController.clear();
                heightController.clear();
              },

              child: const Text('Save Values'),
            ),
          ],
        ),
      ),
    );
  }

  //make a sharedpreference function to store all data
  Future<void> saveData(
    String username,
    int age,
    double height,
    bool isLogged,
  ) async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString("userName", username);
    await pref.setInt("age", age);
    await pref.setDouble("height", height);
    await pref.setBool("isLogged", isLogged);
  }
}
