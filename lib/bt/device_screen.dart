import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_classic/flutter_blue_classic.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key, required this.connection});

  final BluetoothConnection connection;

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  StreamSubscription? _readSubscription;
  final List<String> _receivedInput = [];

  @override
  void initState() {
    _readSubscription = widget.connection.input?.listen((event) {
      log('Connection established: ${widget.connection.isConnected}');

      setState(() => _receivedInput.add(utf8.decode(event)));
      log('Raw input: ${utf8.decode(event)}');

      log("Receiving inputs");
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.connection.dispose();
    _readSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connection to ${widget.connection.address}"),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              try {
                widget.connection.writeString("hello world");
                log("Sent a hello world messsage");
              } catch (e) {
                if (kDebugMode) print(e);
                ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                  SnackBar(
                    content: Text(
                        "Error sending to device. Device is ${widget.connection.isConnected ? "connected" : "not connected"}"),
                  ),
                );
              }
            },
            child: const Text("Send hello world to remote device"),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Received data",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          for (String input in _receivedInput)
            Text(
              input,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}
