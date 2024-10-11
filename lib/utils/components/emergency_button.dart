import 'package:flutter/material.dart';

class EmergencyButton extends StatefulWidget {
  @override
  _EmergencyButtonState createState() => _EmergencyButtonState();
}

class _EmergencyButtonState extends State<EmergencyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 450), // Adjust for soft press
      reverseDuration:
          const Duration(milliseconds: 600), // Adjust for soft release
      vsync: this,
      lowerBound: 0.975, // How much to "go in"
      upperBound: 1.0, // Return to full size
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            onTapDown: (_) {
              _controller.reverse(); // Start the "press" animation
            },
            onTapUp: (_) {
              _controller.forward(); // Return to normal size
            },
            onTapCancel: () {
              _controller.forward(); // Handle cancel, return to normal size
            },
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _controller.value,
                  child: child,
                );
              },
              child: Image.asset(
                "assets/images/sos_button.png",
                height: 300,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
