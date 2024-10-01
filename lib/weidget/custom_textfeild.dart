import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield(
      {super.key, this.onchange, this.inputType,required this.text, this.obsecure = false});
  final String text;
  bool? obsecure;
TextInputType? inputType;
  void Function(String data)? onchange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecure!,
      keyboardType: inputType,

      onChanged: onchange,
      decoration: InputDecoration(
          label: Text(
            text,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black)
          , borderRadius: BorderRadius.circular(8),),

          border:  OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
         ), 
      ),
      
    );
  }
}
