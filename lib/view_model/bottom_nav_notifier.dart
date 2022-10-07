import 'package:flutter/material.dart';
import 'package:library_api_mvvm/view/audio/audio_books.dart';
import 'package:library_api_mvvm/view/books/books_screen.dart';
import 'package:library_api_mvvm/view/home/home.dart';

final List<Widget> pages = [
  const LibraryHome(),
  const BookScreen(),
  const AudioBooks(),
];
