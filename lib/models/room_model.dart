import 'devices_model.dart';

class Room {
  final String name;
  final String backgroundImage;
  final double temperature;
  final double lightLevel;
  final List<Devices> devices;

  Room({
    required this.name,
    required this.backgroundImage,
    required this.temperature,
    required this.lightLevel,
    required this.devices,
  });
}
