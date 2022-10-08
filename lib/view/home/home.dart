import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
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
          Consumer<BookProvider>(builder: (context, value, child) {
            return IconButton(
              onPressed: () async {
                value.isFetching
                    ? await Provider.of<BookProvider>(context, listen: false)
                        .getForYouBooks ()
                    : null;
              },
              icon: value.isFetching
                  ? const Icon(Icons.get_app_rounded)
                  : const Icon(Icons.done),
              tooltip: 'Fetch API',
            );
          }),
          const SizedBox(width: 2)
        ],
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const Drawer(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          sizedbox,
          SearchBar(),
          sizedbox,
          SectionHead(name: 'New & Trending'),
          sizedbox,
          LibraryList(),
          SizedBox(height: 15),
          SectionHead(name: 'For you'),
          SizedBox(height: 15),
          LibraryList()
        ],
      ),
    );
  }
}
