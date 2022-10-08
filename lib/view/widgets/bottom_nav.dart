import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view_model/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<BottomNavigationBarProvider>(context, listen: true);

    return Consumer<BottomNavigationBarProvider>(
      builder: (context, value, child) {
        return CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: rootColor,
          onTap: (newIndex) {
            provider.changeNavigation(newIndex);
          },
          index: value.selectedIndex,
          items: [
            Image.asset(
              value.selectedIndex == 0 ? selectedlibrary : unselectedlibrary,
              height: 35,
            ),
            Image.asset(
              value.selectedIndex == 1 ? selectedbook : unselectedbook,
              height: 35,
            ),
            Image.asset(
              value.selectedIndex == 2 ? selectedheadset : unselectedheadset,
              height: 35,
            ),
          ],
        );
      },
    );
  }
}
