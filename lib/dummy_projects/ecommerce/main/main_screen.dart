import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rwad_two/dummy_projects/ecommerce/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    Container(
      child: Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "Setting",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Colors.grey.withOpacity(.2),
        items: const [
          Icon(Icons.home, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
