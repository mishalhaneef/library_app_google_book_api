import 'package:flutter/material.dart';
import 'package:library_api_mvvm/view/widgets/detail_screen.dart';
import '../../../model/book_model.dart';

class LibraryList extends StatelessWidget {
  const LibraryList({Key? key, required this.booksList}) : super(key: key);
  final List<Book> booksList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          SizedBox(
            height: 300,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: booksList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final book = booksList[index];
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25))),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return buildSheet(book, context);
                            },
                          );
                        },
                        child: BookBuild(book: book),
                      ),
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 20);
              },
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}

class BookBuild extends StatelessWidget {
  const BookBuild({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

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
              image: AssetImage(book.image),
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
            book.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          book.author,
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        )
      ],
    );
  }
}
