import 'package:flutter/material.dart';
import '/model/User.dart';

Future showRequestsBottomModalSheet(BuildContext context, Contact contact) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      String initialChar = contact.name.characters.first;
      return Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.indigoAccent.shade200.withOpacity(0.075),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.indigoAccent,
                          child: Text(
                            initialChar,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      contact.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      contact.relationship,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      contact.mobileNumber,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text("Call Now"),
                      icon: const Icon(
                        Icons.phone_rounded,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
