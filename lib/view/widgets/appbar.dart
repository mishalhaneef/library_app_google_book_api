import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(notifications, height: 25),
        ),
        const SizedBox(width: 2)
      ],
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
