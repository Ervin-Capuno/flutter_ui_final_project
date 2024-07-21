import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/room_model.dart';

class BottomSheetManager {
  static void showRoomDetailsBottomSheet(BuildContext context, Room room) {
    String dropdownValue = room.control;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.name,
                      style: const TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.thermostat_rounded,
                            color: Colors.orange),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Temperature',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '${room.temperature} °C',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb_rounded,
                            color: Colors.yellow),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Light Level',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '${room.lightLevel} lux',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.settings, color: Colors.blue),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Control Mode',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8.0),
                            DropdownButton<String>(
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    dropdownValue = newValue;
                                    room.control =
                                        newValue; // Update room's control mode
                                  });
                                }
                              },
                              items: <String>[
                                'Automatic',
                                'Manual'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            String message = '';
                            if (room.control == 'Automatic') {
                              message = 'Control mode set to Automatic';
                            } else {
                              message = 'Control mode set to Manual';
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void showAddDeviceBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _buildBottomSheet(
          context,
          title: 'Add Device',
          formFields: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Device Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter device name';
                }
                return null;
              },
            ),
            TextFormField(
              decoration:
                  const InputDecoration(labelText: 'Device Background Image'),
            ),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Room name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a room';
                }
                return null;
              },
              items: rooms.map((Room room) {
                return DropdownMenuItem<String>(
                  value: room.name,
                  child: Text(room.name),
                );
              }).toList(),
              onChanged: (String? value) {},
            ),
          ],
          formKey: _formKey,
        );
      },
    );
  }

  static void showAddRoomBottomSheet(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _buildBottomSheet(
          context,
          title: 'Add Room',
          formFields: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Room Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter room name';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Room Image'),
            ),
          ],
          formKey: _formKey,
        );
      },
    );
  }

  static Widget _buildBottomSheet(BuildContext context,
      {required String title,
      required List<Widget> formFields,
      required GlobalKey<FormState> formKey}) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              ...formFields,
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    String message = title == 'Add Device'
                        ? 'Device added successfully'
                        : 'Room added successfully';
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
