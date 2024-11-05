import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_classic/flutter_blue_classic.dart';
import 'package:permission_handler/permission_handler.dart';
import 'device_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<ScanScreen> {
  final _flutterBlueClassicPlugin = FlutterBlueClassic();

  BluetoothAdapterState _adapterState = BluetoothAdapterState.unknown;
  StreamSubscription? _adapterStateSubscription;

  final Set<BluetoothDevice> _scanResults = {};
  StreamSubscription? _scanSubscription;

  bool _isScanning = false;
  int? _connectingToIndex;
  StreamSubscription? _scanningStateSubscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  getLocationPermission() async {
    PermissionStatus locationPermissionStatus =
        await Permission.locationAlways.status;

    if (locationPermissionStatus.isDenied) {
      Permission.location.request();
      Permission.locationAlways.request();
    }
    if (locationPermissionStatus.isLimited) {
      Permission.location.request();
      Permission.locationAlways.request();
    }
  }

  Future<void> initPlatformState() async {
    BluetoothAdapterState adapterState = _adapterState;
    getLocationPermission();
    try {
      adapterState = await _flutterBlueClassicPlugin.adapterStateNow;
      _adapterStateSubscription =
          _flutterBlueClassicPlugin.adapterState.listen((current) {
        if (mounted) setState(() => _adapterState = current);
      });
      _scanSubscription =
          _flutterBlueClassicPlugin.scanResults.listen((device) {
        if (mounted) setState(() => _scanResults.add(device));
      });
      _scanningStateSubscription =
          _flutterBlueClassicPlugin.isScanning.listen((isScanning) {
        if (mounted) setState(() => _isScanning = isScanning);
      });
    } catch (e) {
      if (kDebugMode) print(e);
    }

    if (!mounted) return;

    setState(() {
      _adapterState = adapterState;
    });
  }

  @override
  void dispose() {
    _adapterStateSubscription?.cancel();
    _scanSubscription?.cancel();
    _scanningStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // List<BluetoothDevice> scanResults = _scanResults.toList();
    List<BluetoothDevice> scanResults =
        _scanResults.where((o) => o.name != null).toList();
    // scanResults.where((o) => o.name != null).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterBlueClassic'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Bluetooth Adapter state"),
            subtitle: const Text("Tap to enable"),
            trailing: Text(_adapterState.name),
            leading: const Icon(Icons.settings_bluetooth),
            onTap: () => _flutterBlueClassicPlugin.turnOn(),
          ),
          const Divider(),
          if (scanResults.isEmpty)
            const Center(child: Text("No devices found yet"))
          else
            for (var (index, result) in scanResults.indexed)
              ListTile(
                title: Text("${result.name ?? "???"} (${result.address})"),
                subtitle: Text(
                    "Bondstate: ${result.bondState.name}, Device type: ${result.type.name}"),
                trailing: index == _connectingToIndex
                    ? const CircularProgressIndicator()
                    : Text("${result.rssi} dBm"),
                onTap: () async {
                  BluetoothConnection? connection;
                  setState(() => _connectingToIndex = index);
                  try {
                    connection =
                        await _flutterBlueClassicPlugin.connect(result.address);
                    if (!this.context.mounted) return;
                    if (connection != null && connection.isConnected) {
                      if (mounted) setState(() => _connectingToIndex = null);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DeviceScreen(connection: connection!)));
                    }
                  } catch (e) {
                    if (mounted) setState(() => _connectingToIndex = null);
                    if (kDebugMode) print(e);
                    connection?.dispose();
                    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
                      const SnackBar(
                        content: Text("Error connecting to device"),
                      ),
                    );
                  }
                },
              )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        onPressed: () {
          getLocationPermission();
          if (_isScanning) {
            _flutterBlueClassicPlugin.stopScan();
            log("Stopped Scan");
          } else {
            _scanResults.clear();
            _flutterBlueClassicPlugin.startScan();
            log("Started Scan");
          }
        },
        label: Text(
          _isScanning ? "Scanning..." : "Start device scan",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        icon: Icon(
          _isScanning ? Icons.bluetooth_searching : Icons.bluetooth,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
