import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    // required this.data,
    required this.onTap,
    this.text = 'Sign In',
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;
  // final bool data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 230,
        decoration: BoxDecoration(
          color: rootColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
