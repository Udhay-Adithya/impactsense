import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/components/bottom_nav_bar.dart';

class EmergencyAlertPage extends StatefulWidget {
  const EmergencyAlertPage({super.key});

  @override
  State<EmergencyAlertPage> createState() => _EmergencyAlertPageState();
}

class _EmergencyAlertPageState extends State<EmergencyAlertPage> {
  int countDown = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  void startCountDown() {
    if (_timer != null) {
      _timer!.cancel();
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (countDown > 0) {
          countDown--;
        } else {
          _timer!.cancel();
          // You can trigger an emergency alert action here when the countdown finishes
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alert"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Container(
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.emergency_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Sending\nEmergency Alert",
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.2,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "SOS will be sent once the timer ends",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.2,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "$countDown",
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Tap the timer to stop",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.2,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    color: const Color(0xFF252b43),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.support_agent_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    color: const Color(0xFF252b43),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Container(
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(
                        Icons.sos,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _timer?.cancel();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => const BottomNavBar(),
                  ),
                );
                // Cancel emergency alert action here
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.red,
                  minimumSize: const Size(200, 45)),
              label: Text(
                "Cancel",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              icon: Icon(
                Icons.close_rounded,
                color: Theme.of(context).colorScheme.surface,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
