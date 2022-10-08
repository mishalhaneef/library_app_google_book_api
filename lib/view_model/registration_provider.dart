import 'package:flutter/material.dart';
import 'package:library_api_mvvm/model/user_model/user_model.dart';

class RegistrationProvider extends ChangeNotifier {
  UserModel userData = UserModel(name: '', age: '', favBook: '');

  saveData(name, age, favBook) async {
    userData = UserModel(
      name: name,
      age: age,
      favBook: favBook,
    );
  }
}
