
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({
    Key? key,
    required this.selectFile,
  }) : super(key: key);

  final selectFile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectFile,
      child: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.grey,
          strokeWidth: 1,
          dashPattern: const [5, 5],
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: liteBlue, borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.folder_copy_rounded,
                    color: blueColor,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Choose image here',
                    style: TextStyle(
                        color: Color.fromARGB(255, 128, 128, 128),
                        fontFamily: 'poppins regular',
                        fontSize: 13),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '(Max file size 50mb)',
                    style: TextStyle(
                        color: Color.fromARGB(255, 192, 192, 192),
                        fontFamily: 'poppins regular',
                        fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
