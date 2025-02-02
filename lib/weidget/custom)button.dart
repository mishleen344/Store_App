import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.ontap, required this.text});
  VoidCallback? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8)
        ),
        width: double.infinity,
        height: 60,
        child: Text(text , style: TextStyle(
          color: Colors.white,
        ),),
      ),

    );





  }
}
