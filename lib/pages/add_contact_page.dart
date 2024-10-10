import 'package:flutter/material.dart';

import '../model/User.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();

  void _submitContact() {
    final String name = _nameController.text;
    final String relationship = _relationshipController.text;
    if (name.isNotEmpty && relationship.isNotEmpty) {
      final newContact = Contact(
          name: name,
          relationship: relationship,
          mobileNumber: _mobileNumberController.text);
      Navigator.pop(context, newContact);
    } else {
      // Optionally show a validation error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in both fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _relationshipController,
              decoration: const InputDecoration(labelText: "Relationship"),
            ),
            TextField(
              controller: _mobileNumberController,
              decoration: const InputDecoration(labelText: "Mobile Number"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitContact,
              child: const Text("Add Contact"),
            ),
          ],
        ),
      ),
    );
  }
}
