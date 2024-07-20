import 'package:flutter/material.dart';
import 'room_page.dart';
import 'models/room_model.dart';
import 'common_widgets/devices_widgets.dart';
import 'common_widgets/bottom_sheet.dart';
import 'models/devices_model.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  Room? _selectedRoom; // Track the selected room

  List<Room> rooms = [
    Room(
      name: 'Living Room',
      backgroundImage: 'img/living_room.jpg',
      temperature: 31.0,
      lightLevel: 89.1,
      devices: [
        Devices(
          name: 'TV',
          image: 'img/tv.jpg',
          state: 'On',
          consumption: '150W',
        ),
        Devices(
          name: 'Lamp',
          image: 'img/lamp.jpg',
          state: 'Off',
          consumption: '20W',
        ),
      ],
    ),
    Room(
      name: 'Kitchen',
      backgroundImage: 'img/kitchen.jpg',
      temperature: 27.0,
      lightLevel: 87.1,
      devices: [
        Devices(
          name: 'Electric Stove',
          image: '',
          state: '',
          consumption: '',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Featured Rooms',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: rooms.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedRoom = rooms[index];
                  });
                },
                onDoubleTap: () {
                  _navigateToRoomPage(rooms[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(rooms[index].backgroundImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Text(
                            rooms[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _selectedRoom != null
              ? Text(
                  "${_selectedRoom!.name}'s Devices",
                  style: const TextStyle(fontSize: 24.0),
                )
              : const Text(
                  "Room's Devices",
                  style: TextStyle(fontSize: 24.0),
                ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          child: _selectedRoom != null
              ? ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  itemCount: _selectedRoom!.devices.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(height: 8.0),
                  itemBuilder: (BuildContext context, int index) {
                    final device = _selectedRoom!.devices[index];
                    return GestureDetector(
                      onTap: () {
                        _showDeviceBottomSheet(device);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: DeviceCard(
                          name: device.name,
                          image: device.image,
                          state: device.state,
                          consumption: device.consumption,
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'Select a room to view devices',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
        ),
      ],
    );
  }

  void _navigateToRoomPage(Room room) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomPage(
          temperature: room.temperature,
          lightLevel: room.lightLevel,
          backgroundImage: room.backgroundImage,
        ),
      ),
    );
  }

  void _showDeviceBottomSheet(Devices device) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return DeviceBottomSheet(
          device: device,
          updateDeviceState: (newDevice) {
            setState(() {
              for (int i = 0; i < rooms.length; i++) {
                if (rooms[i].devices.contains(device)) {
                  final index = rooms[i].devices.indexOf(device);
                  rooms[i].devices[index] = newDevice;
                }
              }
            });
            Navigator.pop(context, true);
          },
        );
      },
    );
  }
}
