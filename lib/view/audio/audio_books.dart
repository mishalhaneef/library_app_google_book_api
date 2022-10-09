// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view/audio/widgets/audio_slide.dart';
import 'package:library_api_mvvm/view/audio/widgets/disk_cover.dart';
import 'package:library_api_mvvm/view/audio/widgets/disk_widget.dart';
import 'package:library_api_mvvm/view/audio/widgets/play_pause.dart';
import 'package:library_api_mvvm/view/widgets/snackbar.dart';

class AudioBooks extends StatefulWidget {
  const AudioBooks({super.key});

  @override
  State<AudioBooks> createState() => _AudioBooksState();
}

class _AudioBooksState extends State<AudioBooks>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();
  // final audioPlayer = AudioPlayer();
  // bool isPlaying = false;
  // Duration duration = Duration.zero;
  // Duration position = Duration.zero;

  // @override
  // void initState() {
  //   super.initState();

  //   audioPlayer.onPlayerStateChanged.listen((state) {
  //     setState(() {
  //       isPlaying = state == PlayerState.playing;
  //     });
  //   });

  //   audioPlayer.onDurationChanged.listen((newDuration) {
  //     setState(() {
  //       duration = newDuration;
  //     });
  //   });

  //   audioPlayer.onPositionChanged.listen((newPosition) {
  //     setState(() {
  //       position = newPosition;
  //     });
  //   });
  // }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text(
            'AudioBooks',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiskWIdget(controller: _controller),
            sizedbox,
            const DiskCover(),
            const SizedBox(height: 10),
            const Text('Benjamin Graham'),
            sizedbox,
            const AudioSlide(),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('0:00', style: TextStyle(color: Colors.brown)),
                  Text('01:13:45', style: TextStyle(color: Colors.brown)),
                ],
              ),
            ),
            PlayPauseButton(
              onPressed: () async {
                // if (isPlaying) {
                //   await audioPlayer.pause();
                // } else {
                //   await audioPlayer
                //       .play(DeviceFileSource('assets/audio/audio_book.mp3'));
                // }
                snackBar('Error while palying audio', context);
              },
            )
          ],
        ));
  }
}
