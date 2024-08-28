import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> _screens = [
    Container(
      child: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 50),
        ),
      ),
    ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
    );
  }
}
