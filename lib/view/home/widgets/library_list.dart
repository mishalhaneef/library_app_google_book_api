import 'package:flutter/material.dart';
import 'package:library_api_mvvm/model/book_model/volume_info.dart';
import 'package:library_api_mvvm/view_model/book_provider.dart';
import 'package:provider/provider.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({
    Key? key,
    // required this.booksList,
  }) : super(key: key);
  // final List<Book> booksList;

  @override
  Widget build(BuildContext context) {
    final widgets = Provider.of<BookProvider>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<BookProvider>(builder: (context, value, child) {
        if (value.isFetching) {
          return widgets.circularProgress();
        } else {
          return widgets.buildHomeBooks(value);
        }
      }),
    );
  }
}

// widgets
class BookBuild extends StatelessWidget {
  const BookBuild({
    Key? key,
    required this.book,
  }) : super(key: key);

  final VolumeInfo? book;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(book!.imageLinks!.thumbnail!),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Science',
          style: TextStyle(color: Color(0xFFDAA963)),
        ),
        const SizedBox(height: 3),
        SizedBox(
          width: 100,
          child: Text(
            book!.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          book!.authors![0],
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    );
  }
}
