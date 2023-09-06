import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/presentation/widgets/user_input.dart';

class AddSc extends StatelessWidget {
  const AddSc({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    TextEditingController subtitle = TextEditingController();
    final key = GlobalKey<FormState>();
    return SafeArea(
      child: Form(
        key: key,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserInputwidget(
                      maxline: 2,
                      controller: title,
                      hinttext: "title",
                      function: (val) {
                        if (val == "") {
                          return "cant be empty";
                        }
                        return null;
                      })),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: UserInputwidget(
                      maxline: 5,
                      controller: subtitle,
                      hinttext: "subtitle",
                      function: (val) {
                        if (val == "") {
                          return "cant be empty";
                        }
                        return null;
                      })),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      backgroundColor: Colors.yellow),
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      BlocProvider.of<TodoBloc>(context).add(
                        AddTodoEvent(
                            title: title.text,
                            subtitle: subtitle.text,
                            time: DateTime.now()),
                      );
                      Navigator.pop(context);
                    } else {}
                  },
                  child:
                      const Text("add", style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
      ),
    );
  }
}
