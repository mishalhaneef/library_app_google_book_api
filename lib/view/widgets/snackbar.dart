import 'package:flutter/material.dart';

snackBar(text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    content: Text(text),
    duration: const Duration(seconds: 5),
  ));
}
