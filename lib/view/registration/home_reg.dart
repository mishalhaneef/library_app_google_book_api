import 'dart:io';
import 'package:flutter/material.dart';
import 'package:library_api_mvvm/core/constants.dart';
import 'package:library_api_mvvm/view/registration/dashboard.dart';
import 'package:library_api_mvvm/view/registration/widgets/formbox.dart';
import 'package:library_api_mvvm/view/registration/widgets/register_button.dart';
import 'package:library_api_mvvm/view/registration/widgets/text_field.dart';

final nameController = TextEditingController();
final ageController = TextEditingController();
final favouriteBookController = TextEditingController();
bool? userData;

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBox(
                size: size,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Enter Your Data',
                    style: TextStyle(
                      fontFamily: 'Poppins semibold',
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(
                    hint: 'First name',
                    controller: nameController,
                  ),
                  TextFieldWidget(
                    hint: 'Age',
                    controller: ageController,
                  ),
                  TextFieldWidget(
                    hint: 'Favourite book',
                    controller: favouriteBookController,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () {
                  final name = nameController.text;
                  final age = ageController.text;
                  final favBook = favouriteBookController.text;
                  if (nameController.text.isEmpty) {
                    snackBar(context, 'Enter name', Colors.red);
                  } else if (ageController.text.isEmpty) {
                    snackBar(context, 'Enter age', Colors.red);
                  } else if (favouriteBookController.text.isEmpty) {
                    snackBar(context, 'Enter favourite Book', Colors.red);
                  }else {
                    snackBar(context, 'Submitted', Colors.green);

                   Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoard(),
                  ),
                  (route) => false,
                );
                  }
                  
                  // //     ));
                  // nameController.clear();
                  // ageController.clear();
                  // favBookController.clear();
                },
              ),
              // const Text(
              //     '(double tap submit to sync with firebase)',
              //     style: TextStyle(
              //         color: Color.fromARGB(255, 192, 192, 192),
              //         fontFamily: 'poppins regular',
              //         fontSize: 10),
              //   ),
            ],
          ),
        ),
      )),
    );
  }
}

snackBar(context, text, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(text),
    ),
  );
}
