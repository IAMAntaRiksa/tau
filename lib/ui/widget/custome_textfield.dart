import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputAction action;
  final TextInputType type;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? onValidator;

  const CustomTextField({
    Key? key,
    required this.action,
    required this.type,
    required this.hintText,
    required this.onValidator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        textInputAction: action,
        keyboardType: type,
        controller: controller,
        validator: onValidator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          hintText: hintText,
        ),
      ),
    );
  }
}
