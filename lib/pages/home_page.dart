import 'package:flutter/material.dart';

import '../utils/components/alerts_carousel.dart';
import '../utils/components/emergency_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ElevatedButton(
    //         onPressed: () {
    //           Navigator.of(context).push(
    //             MaterialPageRoute(
    //               builder: (builder) => const ScanScreen(),
    //             ),
    //           );
    //         },
    //         child: const Text("Scan"),
    //       ),
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          expandedHeight: 100,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Hello 👋,",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "\nUdhay Adithya",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 22,
                      ),
                      splashRadius: 30,
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Emergency help\nneeded ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Just hold the button to call",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.tertiary),
              ),
            ],
          ),
        ),
        EmergencyButton(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Not sure what to do?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Pick the subject to alert",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.tertiary),
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: AlertsCarousel(),
        )
      ],
    ));
  }
}
