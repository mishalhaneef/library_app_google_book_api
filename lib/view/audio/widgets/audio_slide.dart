
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';


class AudioSlide extends StatelessWidget {
  const AudioSlide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: rootColor,
      thumbColor: Colors.brown,
      inactiveColor: rootColor.withOpacity(0.3),
      min: 0,
      max: 10,
      value: 1,
      onChanged: (value) async {
        // final position = Duration(seconds: value.toInt());
        // await audioPlayer.seek(position);

        // await audioPlayer.resume();
      },
    );
  }
}