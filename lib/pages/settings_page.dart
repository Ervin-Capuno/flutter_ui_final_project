import 'package:flutter/material.dart';
import 'bluetooth_settings_tab.dart';
import 'wifi_settings_tab.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Wi-Fi'),
              Tab(text: 'Bluetooth'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            WifiSettingsPage(),
            BluetoothSettingsPage(),
          ],
        ),
      ),
    );
  }
}
