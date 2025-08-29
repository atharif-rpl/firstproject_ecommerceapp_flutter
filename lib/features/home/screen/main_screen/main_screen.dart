import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_mobile/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/features/features.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.name});

  final String name;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final List<Widget> screens = [
    HomeScreen(name: widget.name,),
    ProfileScreen(),
    CartScreen(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color (0xFF393939),
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Color(0xFFFFC14B),),
          Icon(Icons.person, size: 30),
          Icon(Icons.shopping_basket, size: 30),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex=index;
          });
        },
        index: selectedIndex,
      ),
      );
  }
}