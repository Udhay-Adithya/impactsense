import 'package:flutter/material.dart';
import 'package:impactsense/utils/widgets/contact_icons.dart';

import '../model/User.dart';
import '../utils/components/contact_bottom_sheet.dart';
import 'add_contact_page.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> contacts = [];

  void _addContact(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Contacts"),
        actions: [
          TextButton.icon(
            onPressed: () async {
              // Navigate to AddContactPage and wait for the result
              final newContact = await Navigator.push<Contact>(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddContactPage(),
                ),
              );
              if (newContact != null) {
                _addContact(newContact);
              }
            },
            iconAlignment: IconAlignment.end,
            label: Text(
              "Add",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context)
                    .colorScheme
                    .primary, // Ensure text is visible on AppBar
              ),
            ),
            icon: Icon(
              Icons.add,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
      body: contacts.isEmpty
          ? const Center(child: Text("No contacts added"))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.relationship),
                  leading: ContactIcons(name: contact.name),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () => showRequestsBottomModalSheet(context, contact),
                );
              },
            ),
    );
  }
}
