import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/views/main/Mint.dart';
import 'package:rune/ui/views/main/Profile.dart';
import 'package:rune/ui/views/main/explore.dart';
import 'package:rune/ui/views/main/home.dart';
import 'package:rune/ui/views/main/watch.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screens = [Home(), Explore(), Watch(), Mint(), Profile()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 70,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.black, // Background color of navbar
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildNavItem(Icons.home, 0),
                  _buildNavItem(Icons.emoji_events, 1),
                  const SizedBox(
                      width: 60), // Placeholder for the center button
                  _buildNavItem(Icons.dashboard, 3),
                  _buildNavItem(Icons.person, 4),
                ],
              ),
            ),
          ),
          // Center circular button
          Positioned(
            bottom: 10,
            child: GestureDetector(
              onTap: () => _onItemTapped(2), // Center button index
              child: Container(
                height: 65,
                width: 65,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white, // Center button color
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 6,
                  ),
                ),
                child: SvgPicture.asset('assets/svgs/bottom_nav/fab.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        color: _selectedIndex == index ? Colors.white : Colors.grey,
      ),
    );
  }
}
