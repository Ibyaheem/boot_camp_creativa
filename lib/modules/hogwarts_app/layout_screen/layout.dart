import 'package:boot_camp_creativa/modules/hogwarts_app/profile_screen/profile.dart';
import 'package:boot_camp_creativa/modules/hogwarts_app/settings_screen/settings.dart';
import 'package:boot_camp_creativa/modules/hogwarts_app/view_screen/view.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    ViewScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];
  List<String> titles = [
    'Characters',
    'Profile',
    'Settings',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_max_outlined,
              ),
              label: 'Characters'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
