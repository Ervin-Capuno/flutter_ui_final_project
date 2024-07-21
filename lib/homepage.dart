import 'package:flutter/material.dart';
import 'common_widgets/bottom_sheet_class.dart';
import 'common_widgets/skeleton.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'homepage_content.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isShowDial = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 9));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CozyControl'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('img/Killua.jpg'),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Smart UI'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      body: SkeletonLoader(
        isLoading: _isLoading,
        child: HomePageContent(),
      ),
      floatingActionButton: SpeedDialMenuButton(
        isShowSpeedDial: _isShowDial,
        updateSpeedDialStatus: (isShow) {
          setState(() {
            _isShowDial = isShow;
          });
        },
        isMainFABMini: false,
        mainMenuFloatingActionButton: MainMenuFloatingActionButton(
          mini: false,
          child: const Icon(Icons.add),
          onPressed: () {},
          closeMenuChild: const Icon(Icons.close),
          closeMenuForegroundColor: Colors.white,
          closeMenuBackgroundColor: Colors.red,
        ),
        floatingActionButtonWidgetChildren: <FloatingActionButton>[
          FloatingActionButton(
            mini: true,
            child: Icon(Icons.lightbulb),
            onPressed: () {
              _isShowDial = false;
              setState(() {
                BottomSheetManager.showAddDeviceBottomSheet(context);
              });
            },
            backgroundColor: Colors.green,
          ),
          FloatingActionButton(
            mini: true,
            child: Icon(Icons.room),
            onPressed: () {
              _isShowDial = false;
              setState(() {
                BottomSheetManager.showAddRoomBottomSheet(context);
              });
            },
            backgroundColor: Colors.orange,
          ),
        ],
        isSpeedDialFABsMini: true,
        paddingBtwSpeedDialButton: 50.0,
      ),
    );
  }
}
