import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/todo_bloc.dart';
import 'package:todo/presentation/widgets/costume_tile.dart';
import 'package:todo/presentation/widgets/empty_list_text.dart';
import 'package:todo/repository/repository.dart';
import 'package:todo/presentation/screens/add_new_todo_screen.dart';
import 'package:todo/presentation/screens/update_todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => Repository(),
        child: BlocProvider(
          create: (context) =>
              TodoBloc(RepositoryProvider.of<Repository>(context))
                ..add(GetAllTodos()),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
          ),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddSc()));
          },
          backgroundColor: Colors.yellowAccent,
          child: const Icon(Icons.add, color: Colors.black),
        ),
        backgroundColor: Colors.black,
        body: BlocListener<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is OperationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Operation success"),
                  duration: Duration(seconds: 1)));
            } else if (state is OperationFailed) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Operation fialed"),
                  duration: Duration(seconds: 1)));
            }
          },
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodosLoadedState) {
                return state.list.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.list.length,
                        itemBuilder: (context, ind) {
                          final todo = state.list[ind];
                          return CostumrTile(
                            title: todo["title"],
                            ontap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Updatetodo(id: todo['id'])));
                            },
                            button: IconButton(
                              onPressed: () {
                                BlocProvider.of<TodoBloc>(context)
                                    .add(DeleteTodoEvent(todo["id"]));
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.yellow,
                            ),
                          );
                        })
                    : const EmptyListCaseText();
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
