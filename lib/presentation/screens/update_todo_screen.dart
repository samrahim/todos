import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/repository/repository.dart';

class Updatetodo extends StatefulWidget {
  final int id;
  const Updatetodo({required this.id, super.key});

  @override
  State<Updatetodo> createState() => _UpdatetodoState();
}

class _UpdatetodoState extends State<Updatetodo> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(RepositoryProvider.of<Repository>(context))
        ..add(GetTodoByIdEvent(id: widget.id)),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is GetTodoByIdState) {
                return Column(
                  children: [
                    Text(state.mp['title']),
                    Text(state.mp['subtitle']),
                    Text(state.mp['id'].toString()),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
