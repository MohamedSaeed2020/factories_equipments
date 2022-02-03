import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final double? width;
  final Color? background;
  final Function() pressed;
  final String text;
  final Color? textColor;
  final double? radius;
  final bool isUpperCase;

  const CustomMaterialButton(
      {this.width = double.infinity,
      this.background = Colors.amber,
      this.textColor = Colors.black,
      this.radius = 0.0,
      this.isUpperCase = true,
      required this.pressed,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: background,
      ),
      child: MaterialButton(
        onPressed: pressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
