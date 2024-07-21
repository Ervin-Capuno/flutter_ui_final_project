import '../models/room_model.dart';
import '../models/devices_model.dart';

List<Room> rooms = [
  Room(
    name: 'Living Room',
    backgroundImage: 'img/living_room.jpg',
    temperature: 31.0,
    lightLevel: 89.1,
    devices: [
      Devices(
        name: 'TV',
        image: '',
        state: 'On',
        consumption: '150 kWh',
      ),
      Devices(
        name: 'Lamp',
        image: '',
        state: 'Off',
        consumption: '20 kWh',
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
        state: 'Off',
        consumption: '31 kWh',
      ),
    ],
  ),
];
