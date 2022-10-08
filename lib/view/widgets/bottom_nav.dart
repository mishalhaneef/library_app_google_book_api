import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view/route_screen.dart';
import 'package:library_api_mvvm/view_model/bottom_nav_notifier.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: RootScreen.selectedIndexNotifier,
      builder: (context, updatedIndex, child) {
        return CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: rootColor,
          onTap: (value) {
            RootScreen.selectedIndexNotifier.value = value;
            // notifierValue.changePage(value);
            // print('selected page : $value');
            // print('notifier updated value : ${notifierValue.currentIndex}');
          },
          index: updatedIndex,
          // backgroundColor: rootColor,
          // selectedIconTheme: const IconThemeData(color: Colors.white),
          // unselectedIconTheme: const IconThemeData(color: Color(0xFFE9D2AE)),
          // elevation: 0,
          items: [
            Image.asset(
              updatedIndex == 0 ? selectedlibrary : unselectedlibrary,
              height: 35,
            ),
            Image.asset(
              updatedIndex == 1 ? selectedbook : unselectedbook,
              height: 35,
            ),
            Image.asset(
              updatedIndex == 2 ? selectedheadset : unselectedheadset,
              height: 35,
            ),
          ],
        );
      },
    );
  }
}
