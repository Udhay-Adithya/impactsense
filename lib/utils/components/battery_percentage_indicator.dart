import 'dart:ui';
import 'package:flutter/material.dart';

class BatteryIndicator extends StatelessWidget {
  final Map<String, String> deviceInfo;
  const BatteryIndicator(this.deviceInfo, {super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30), // Circular shape
      child: BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Glassmorphism effect
        child: Container(
          width: 125, // Diameter of the circle
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white
                .withOpacity(0.2), // Semi-transparent background color
            borderRadius: BorderRadius.circular(20), // Circular shape
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.battery_5_bar_rounded,
                  size: 22,
                ),
                splashRadius: 30, // Set the splash radius
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.75), // Icon color
                onPressed: () async {},
              ),
              Text(
                deviceInfo["battery"].toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
