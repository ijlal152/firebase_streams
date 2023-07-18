
import 'package:flutter/material.dart';
class LabelWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final String fontFamily;

  const LabelWidget(
      {super.key,
      required this.title,
      this.fontSize = 12,
      this.fontFamily = 'Roboto',
      this.fontWeight = FontWeight.w400,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
       
 
        fontFamily: fontFamily,
          fontSize: fontSize, fontWeight: fontWeight, color: textColor),
    );
  }
}
