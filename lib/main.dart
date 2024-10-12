import 'package:flutter/material.dart';
import 'package:impactsense/utils/theme/themes.dart';

import 'pages/emergency_alert_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ImpactSense',
        theme: lightTheme,
        home: const EmergencyAlertPage() //BottomNavBar(),
        );
  }
}
