import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?) validate;
  final TextEditingController controller;
  final TextInputType type;
  final String hint;
  final Function(String)? onSubmit;
  final Function(String)? onChange;
  final IconData? suffix;
  final bool? isPassword;

  final Function()? suffixPressed;

  const CustomTextFormField(
      {required this.validate,
      required this.controller,
      required this.type,
      required this.hint,
      this.isPassword,
      this.onSubmit,
      this.onChange,
      this.suffix,
      this.suffixPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: suffixPressed,
              )
            : null,
      ),
    );
  }
}
