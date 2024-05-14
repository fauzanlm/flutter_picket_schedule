import 'package:flutter/material.dart';
import 'package:flutter_picket_schedule/pages/home.dart';
import 'package:flutter_picket_schedule/pages/settings.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _currentIndex = 0;
  void setCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

  final List<Widget> _body = [
    const HomePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (value) => setCurrentIndex(value),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
      body: _body[_currentIndex],
    );
  }
}
