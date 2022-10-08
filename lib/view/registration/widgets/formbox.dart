import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class FormBox extends StatelessWidget {
  const FormBox({
    Key? key,
    required this.size,
    required this.children,
    this.fheight = 200,
  }) : super(key: key);

  final Size size;
  final List<Widget> children;
  final fheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 2 + 80,
      width: size.width / 2 + 130,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Color.fromARGB(255, 196, 196, 196),
              blurRadius: 5.0,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Column(children: children),
        ],
      ),
    );
  }
}
