import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInputwidget extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  String? Function(String?) function;
  int maxline;
  UserInputwidget(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.function,
      required this.maxline});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
          validator: function,
          maxLines: maxline,
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintText: hinttext,
              hintStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  letterSpacing: 1),
              border: const OutlineInputBorder()),
          controller: controller),
    );
  }
}
