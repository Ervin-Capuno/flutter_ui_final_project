import 'package:flutter/material.dart';

class BluetoothSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const ListTile(
            title: Text('Bluetooth Status'),
            subtitle: Text('Currently connected or disconnected'),
            trailing: Icon(Icons.bluetooth),
          ),
          ListTile(
            title: const Text('Scan for Devices'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Scanning for Devices'),
                    content: const CircularProgressIndicator(),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Stop'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Manage Connected Devices'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
