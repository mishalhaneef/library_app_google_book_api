import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/model/book_model.dart';
import 'package:library_api_mvvm/view/widgets/snackbar.dart';

Widget buildSheet(Book book, context) {
  return Stack(
    children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.remove),
          // book cover image
          Cover(book: book),
          sizedbox,
          // book name, author, and category
          BookDetails(book: book),
          sizedbox,
          // book description
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(
              book.description,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 200),
        ],
      ),
      // bottom card
      const BottomCard(),
    ],
  );
}

// widgets

class Cover extends StatelessWidget {
  const Cover({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 145, right: 145),
      child: Container(
        height: 150,
        width: 100,
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
    );
  }
}

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
            color: rootColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset('assets/rating.png', height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    snackBar('Read option not available', context);
                  },
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Color(0xFFE0B97E),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        'Sample',
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    snackBar('Buy option not available', context);
                  },
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                      child: Text(
                        'Buy',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  const BookDetails({Key? key, required this.book}) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Science',
          style: TextStyle(color: Color(0xFFDAA963)),
        ),
        const SizedBox(height: 3),
        Text(
          book.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          book.author,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        )
      ],
    );
  }
}
