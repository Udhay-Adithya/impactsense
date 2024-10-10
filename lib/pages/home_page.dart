import 'package:flutter/material.dart';
import 'package:impactsense/bt/scan_screen.dart';

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
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(),
            SliverToBoxAdapter(),
          ],
        ));
  }
}
