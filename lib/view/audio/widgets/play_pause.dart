import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: rootColor,
      child: IconButton(
          color: backgroundColor,
          icon: const Icon(Icons.play_arrow),
          iconSize: 30,
          onPressed: onPressed),
    );
  }
}
