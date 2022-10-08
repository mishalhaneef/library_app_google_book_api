import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/model/book_model.dart';
import 'package:library_api_mvvm/view/home/widgets/library_list.dart';
import 'package:library_api_mvvm/view/home/widgets/searchbar.dart';
import 'package:library_api_mvvm/view/home/widgets/section_head.dart';
import 'package:library_api_mvvm/view_model/book_provider.dart';
import 'package:provider/provider.dart';

class LibraryHome extends StatelessWidget {
  const LibraryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final data =
                  await Provider.of<BookProvider>(context, listen: false)
                      .getBooksData();
              // print('data $data');
            },
            icon: Image.asset(notifications, height: 25),
          ),
          const SizedBox(width: 2)
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const Drawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          sizedbox,
          const SearchBar(),
          sizedbox,
          const SectionHead(name: 'New & Trending'),
          sizedbox,
          LibraryList(booksList: books),
          const SizedBox(height: 15),
          const SectionHead(name: 'For you'),
          const SizedBox(height: 15),
          LibraryList(booksList: books.reversed.toList())
        ],
      ),
    );
  }
}
