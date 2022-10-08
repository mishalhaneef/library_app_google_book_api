import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/model/user_model/user_model.dart';
import 'package:library_api_mvvm/view/home/widgets/library_list.dart';
import 'package:library_api_mvvm/view/home/widgets/searchbar.dart';
import 'package:library_api_mvvm/view/home/widgets/section_head.dart';
import 'package:library_api_mvvm/view_model/book_provider.dart';
import 'package:library_api_mvvm/view_model/registration_provider.dart';
import 'package:provider/provider.dart';

List<UserModel> user = [];

class LibraryHome extends StatelessWidget {
  const LibraryHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
     
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: [
          Consumer<BookProvider>(builder: (context, value, child) {
            return IconButton(
              onPressed: () async {
                value.isFetching
                    ? await Provider.of<BookProvider>(context, listen: false)
                        .getForYouBooks()
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
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, bottom: 580, top: 20),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: Consumer<RegistrationProvider>(
                    builder: (context, value, child) {
                  log(value.userData.name);
                  return ListTile(
                    title: Text(value.userData.name),
                    trailing: Text(value.userData.age),
                    subtitle: Text(value.userData.favBook),
                  );
                })),
          ),
        ),
      ),
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
