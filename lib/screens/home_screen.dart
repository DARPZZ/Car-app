import 'package:car_app_real/main.dart';
import 'package:car_app_real/screens/Forsikringer.dart';
import 'package:car_app_real/screens/advanced_sstats.dart';
import 'package:car_app_real/screens/basicinfowidget.dart';
import 'package:car_app_real/screens/camera_screen.dart';
import 'package:car_app_real/screens/udstyrwidget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    
    const BasicInfoWidget(),
    const AdvancedSstats(),
    const Udstyrwidget(),
    const Forsikringer(),
    const CameraScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car App'),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.perm_device_information_rounded),label: "Advanced stats"),
          BottomNavigationBarItem(icon: Icon(Icons.car_crash_outlined),label:"Udstyr liste"),
          BottomNavigationBarItem(icon: Icon(Icons.no_crash_rounded),label:"Forsikringer"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: "Camera"),

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
