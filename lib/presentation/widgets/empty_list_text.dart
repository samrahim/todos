import 'package:flutter/material.dart';

class EmptyListCaseText extends StatelessWidget {
  const EmptyListCaseText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text("add New Todo!",
            style: TextStyle(
              color: Color.fromARGB(255, 249, 224, 2),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            )));
  }
}
