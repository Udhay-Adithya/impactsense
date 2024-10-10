import 'dart:math';

import 'package:flutter/material.dart';

class ContactIcons extends StatelessWidget {
  final String name;
  const ContactIcons({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Random randomObj = Random();
    final List<Color> colors = [
      Colors.red.shade100,
      Colors.amber.shade100,
      Colors.blue.shade100,
      Colors.pink.shade100,
      Colors.purple.shade100,
      Colors.indigo.shade100,
    ];
    String initialChar = (name.characters).first;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 50,
        width: 50,
        color: colors[randomObj.nextInt(6)],
        child: Center(
          child: Text(
            initialChar,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
