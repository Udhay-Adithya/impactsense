import 'package:flutter/material.dart';

class BtIcon extends StatefulWidget {
  final Map<String, String> beachInfo;
  const BtIcon(this.beachInfo, {super.key});

  @override
  State<BtIcon> createState() => _BtIconState();
}

class _BtIconState extends State<BtIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(
            Icons.bluetooth_rounded,
            size: 24,
          ),
          splashRadius: 30,
          color: Colors.black,
          onPressed: () async {},
        ),
      ),
    );
  }
}
