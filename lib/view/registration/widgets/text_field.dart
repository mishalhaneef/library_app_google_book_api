
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/core/enums.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    required this.hint,
    this.page = Screens.form,
  }) : super(key: key);

  final String hint;
  final controller;
  final Screens page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 38, left: 38, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(width: 8),
              Text(
                hint,
                style: const TextStyle(
                    color: Color(0xFF4C4C4C),
                    fontFamily: 'poppins regular',
                    fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 47,
            child: TextField(
              enabled: page == Screens.form ? true : false,
              keyboardType:
                  hint == 'Age' ? TextInputType.number : TextInputType.text,
              controller: controller,
              autofocus: false,
              decoration: const InputDecoration(
                disabledBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: rootColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: rootColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: rootColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
