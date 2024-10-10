import 'package:flutter/material.dart';
import 'package:impactsense/bt/scan_screen.dart';

import '../bt/device_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          //ElevatedButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (builder) => DeviceScreen()));}, child: Text("Device")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => ScanScreen(),
                  ),
                );
              },
              child: Text("Scan"))
        ],
      ),
    );
  }
}
