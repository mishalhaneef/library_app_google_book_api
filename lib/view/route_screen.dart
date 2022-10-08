import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view/widgets/bottom_nav.dart';
import 'package:library_api_mvvm/view/audio/audio_books.dart';
import 'package:library_api_mvvm/view/books/books_screen.dart';
import 'package:library_api_mvvm/view/home/home.dart';
import 'package:library_api_mvvm/view_model/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration.zero, () => showAlert(context));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Consumer<BottomNavigationBarProvider>(builder: (context, value, _) {
        return pages[value.selectedIndex];
      }),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

final List<Widget> pages = [
  const LibraryHome(),
  const BookScreen(),
  const AudioBooks(),
];
