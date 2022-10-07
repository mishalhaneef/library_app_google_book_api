import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();
    final double size = MediaQuery.of(context).size.width / 2 - 170;
    return Padding(
      padding: EdgeInsets.only(right: size, left: size),
      child: Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Center(
            child: TextField(
              enabled: false,
              controller: text,
              decoration: InputDecoration(
                hintText: '  What whould like to read?',
                hintStyle:
                    const TextStyle(color: Color(0xffA9A19C), fontSize: 14),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                      onTap: () {}, child: Image.asset(search, height: 8)),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
