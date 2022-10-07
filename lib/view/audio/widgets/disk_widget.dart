import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class DiskWIdget extends StatelessWidget {
  const DiskWIdget({
    Key? key,
    required AnimationController controller,
  }) : _controller = controller, super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Column(
            children: [
              sizedbox,
              AnimatedBuilder(
                animation: _controller,
                builder: (_, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: child,
                  );
                },
                child: Center(
                  child: Stack(
                    children: const [
                      Material(
                        shape: CircleBorder(side: BorderSide.none),
                        elevation: 15,
                        child: CircleAvatar(
                          maxRadius: 80,
                          backgroundImage: AssetImage(audioBook),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        top: 60,
                        right: 60,
                        left: 60,
                        child: CircleAvatar(
                          backgroundColor: backgroundColor,
                          maxRadius: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sizedbox,
            ],
          ),
        ),
      ),
    );
  }
}
