// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String? hinttext;
  bool obscuretext;
  Function(String)? onChanged;
  CustomTextfield({super.key,
    this.hinttext,
    this.onChanged,
  required  this.obscuretext,

});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if(data!.isEmpty){
          return 'field is required';
        }
        return null;
      },
      onChanged: onChanged,
      obscureText: obscuretext,
      decoration: InputDecoration(

        hintText: hinttext,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),


        ),
      ),
    );

  }
}
