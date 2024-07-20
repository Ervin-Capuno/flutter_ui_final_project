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
  late bool _isOn; // Track the state of the device

  @override
  void initState() {
    super.initState();
    _isOn = widget.device.state == 'On';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.device.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Device State'),
                Switch(
                  value: _isOn,
                  onChanged: (newValue) {
                    setState(() {
                      _isOn = newValue;
                      // Perform the action to update the device state here
                      // For example, you might want to update the device state in the model.
                      widget.device.state = _isOn ? 'On' : 'Off';
                      // Call the callback to update the device state in the parent widget
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
