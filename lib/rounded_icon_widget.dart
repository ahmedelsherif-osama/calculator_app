import 'package:flutter/material.dart';

class RoundedIconWidget extends StatelessWidget {
  RoundedIconWidget(
      {required this.buttonColor,
      required this.textColor,
      required this.text,
      this.function});
  Color buttonColor;
  Color textColor;
  String text;
  VoidCallback? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 7),
        alignment: Alignment.center,
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: buttonColor,
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
