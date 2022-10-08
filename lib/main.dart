import 'package:flutter/material.dart';
import 'package:library_api_mvvm/view/route_screen.dart';
import 'package:library_api_mvvm/view_model/book_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookProvider>(
      create: (context) => BookProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RootScreen(),
      ),
    );
    ;
  }
}
