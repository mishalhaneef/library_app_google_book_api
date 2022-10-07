import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view/widgets/bottom_nav.dart';
import 'package:library_api_mvvm/view_model/bottom_nav_notifier.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return pages[updatedIndex];
          }),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
