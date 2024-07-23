import 'package:flutter/material.dart';
import '../models/devices_model.dart';

class DeviceBottomSheet extends StatefulWidget {
  final Devices device;
  final Function(Devices) updateDeviceState;

  const DeviceBottomSheet({
    Key? key,
    required this.device,
    required this.updateDeviceState,
  }) : super(key: key);

  @override
  _DeviceBottomSheetState createState() => _DeviceBottomSheetState();
}

class _DeviceBottomSheetState extends State<DeviceBottomSheet> {
  late bool _isOn;

  @override
  void initState() {
    super.initState();
    _isOn = widget.device.state == 'On';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.device.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Device State',
                  style: TextStyle(fontSize: 20.0),
                ),
                Switch(
                  value: _isOn,
                  onChanged: (newValue) {
                    setState(() {
                      _isOn = newValue;
                      widget.device.state = _isOn ? 'On' : 'Off';
                      widget.updateDeviceState(widget.device);
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
