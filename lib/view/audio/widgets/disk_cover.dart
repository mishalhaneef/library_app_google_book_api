import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class DiskCover extends StatelessWidget {
  const DiskCover({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          growthIcon,
          height: 20,
        ),
        const SizedBox(width: 10),
        const Text(
          'Intelligent Investors',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
