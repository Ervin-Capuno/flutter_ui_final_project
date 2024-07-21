import 'package:flutter/material.dart';

class BottomSheetManager {
  static void showAddDeviceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _buildBottomSheet(
          context,
          title: 'Add Device',
          formFields: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Device Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Device Background Image'),
            ),
          ],
        );
      },
    );
  }

  static void showAddRoomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return _buildBottomSheet(
          context,
          title: 'Add Room',
          formFields: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Room Name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Room Image'),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildBottomSheet(BuildContext context,
      {required String title, required List<Widget> formFields}) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ...formFields,
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
