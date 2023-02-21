import 'package:flutter/material.dart';
import 'package:lucy/pages/main/home/home.dart';
import 'package:lucy/pages/main/pets/pets.dart';
import 'package:lucy/pages/main/profile/profile.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;
  String _title = "Home";
  Widget _currentWidget = const Home();

  Map<int, Widget> widgetMappings = {
    0: const Home(),
    1: const Pets(),
    2: Profile()
  };

  Map<int, String> titleMappings = {0: 'Home', 1: 'Pets', 2: 'Profile'};

  void _onNavigationItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      _title = titleMappings[index] as String;
      _currentWidget = widgetMappings[_selectedIndex] as Widget;
    });
  }

  Widget _getBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: _onNavigationItemSelected,
      currentIndex: _selectedIndex,
      // ignore: prefer_const_literals_to_create_immutables
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.messenger),
          label: 'Pets',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: _currentWidget,
        ),
        bottomNavigationBar: _getBottomNavigationBar());
  }
}
