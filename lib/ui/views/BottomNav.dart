import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rune/core/models/auth_data_model.dart';
import 'package:rune/imports.dart';
import 'package:rune/ui/view_models/auth_view_model.vm.dart';
import 'package:rune/ui/views/main/Mint.dart';
import 'package:rune/ui/views/main/Profile.dart';
import 'package:rune/ui/views/main/explore.dart';
import 'package:rune/ui/views/main/home.dart';
import 'package:rune/ui/views/main/wallet.dart';
import 'package:rune/ui/views/main/watch.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> screens = [Home(), Explore(), Watch(), Mint(), Wallet()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  getUser() async {
    await AuthData.loadTokensFromLocal();
    print(AuthData().accessToken);
    // await Provider.of<AuthViewModel>(context, listen: false)
    //     .getUser(token: AuthData().accessToken ?? '', context: context);
  }
// ? need to add a loading screen much like a game that shows the user loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main screen content
          Positioned.fill(
            child: screens[_selectedIndex],
          ),

          // Bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  // Background container for the navigation bar with BackdropFilter
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        height: 70,
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(26, 97, 207, 152),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            _buildNavItem('assets/svgs/bottom_nav/home.svg', 0),
                            _buildNavItem('assets/svgs/bottom_nav/cup.svg', 1),
                            const SizedBox(
                                width: 50), // Placeholder for the center button
                            _buildNavItem('assets/svgs/bottom_nav/nfts.svg', 3),
                            _buildNavItem(
                                'assets/svgs/bottom_nav/wallet.svg', 4),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Center circular button
                  Positioned(
                    bottom: 10,
                    left: mediaQuery(context).width * 0.41,
                    child: GestureDetector(
                      onTap: () => _onItemTapped(2), // Center button index
                      child: Container(
                        height: 60,
                        width: 60,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white, // Center button color
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                        ),
                        child:
                            SvgPicture.asset('assets/svgs/bottom_nav/fab.svg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SvgPicture.asset(icon,
          color: _selectedIndex == index ? Colors.white : Colors.grey),
    );
  }
}
