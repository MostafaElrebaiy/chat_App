// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
String name;
VoidCallback? ontap;

CustomButton({super.key,
    required this.name,
  this.ontap
});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: ontap,
            child: Text(
              name,
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),
            )));
  }
}
