import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contacts"),
        actions: [
          TextButton.icon(
            onPressed: () {},
            iconAlignment: IconAlignment.end,
            label: const Text(
              "Add",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            icon: const Icon(
              Icons.add,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
