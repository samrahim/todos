import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostumrTile extends StatelessWidget {
  Function()? ontap;
  String title;
  IconButton button;

  CostumrTile(
      {super.key,
      required this.ontap,
      required this.title,
      required this.button});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(
        title,
        style: const TextStyle(color: Colors.yellow, fontSize: 20),
      ),
      trailing: button,
    );
  }
}
