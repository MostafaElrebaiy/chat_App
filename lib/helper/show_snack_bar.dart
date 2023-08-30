
import 'package:flutter/material.dart';

void showsnackbar(BuildContext context,message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('The password provided is too weak.'),
    ),
  );
}