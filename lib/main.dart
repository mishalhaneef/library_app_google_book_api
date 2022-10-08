import 'package:flutter/material.dart';
import 'package:library_api_mvvm/view/registration/home_reg.dart';
import 'package:library_api_mvvm/view_model/book_provider.dart';
import 'package:library_api_mvvm/view_model/bottom_nav_provider.dart';
import 'package:library_api_mvvm/view_model/registration_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookProvider>(
          create: (context) => BookProvider(),
        ),
        ChangeNotifierProvider<RegistrationProvider>(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationBarProvider>(
          create: (context) => BottomNavigationBarProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const RegistrationPage()
        ),
    );
    ;
  }
}
