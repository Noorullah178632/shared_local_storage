import 'package:flutter/material.dart';

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
                  onChanged: (val) => setState(() => isLoggedIn = !isLoggedIn),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Show Values')),
          ],
        ),
      ),
    );
  }
}
