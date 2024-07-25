import 'package:flutter/material.dart';
import 'common_widgets/bottom_sheet_class.dart';
import 'common_widgets/skeleton.dart';
import 'package:flutter_arc_speed_dial/flutter_speed_dial_menu_button.dart';
import 'package:flutter_arc_speed_dial/main_menu_floating_action_button.dart';
import 'pages/homepage_content.dart';
import 'pages/settings_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
              backgroundImage: AssetImage('img/app_assets/Killua.jpg'),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text(
                  'CozyControl',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                accountEmail: Text(''),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'C',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
      body: SkeletonLoader(
        isLoading: _isLoading,
        child: const HomePageContent(),
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
            heroTag: 'lightbulbTag',
            mini: true,
            onPressed: () {
              _isShowDial = false;
              setState(() {
                BottomSheetManager.showAddDeviceBottomSheet(context);
              });
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.lightbulb),
          ),
          FloatingActionButton(
            heroTag: 'roomTag',
            mini: true,
            onPressed: () {
              _isShowDial = false;
              setState(() {
                BottomSheetManager.showAddRoomBottomSheet(context);
              });
            },
            backgroundColor: Colors.orange,
            child: const Icon(Icons.room),
          ),
        ],
        isSpeedDialFABsMini: true,
        paddingBtwSpeedDialButton: 50.0,
      ),
    );
  }
}
