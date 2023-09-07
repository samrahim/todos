part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {}

class AddTodoEvent extends TodoEvent {
  final String title;
  final String subtitle;
  final DateTime time;

  AddTodoEvent(
      {required this.title, required this.subtitle, required this.time});

  @override
  List<Object> get props => [title, subtitle, time];
}

class DeleteTodoEvent extends TodoEvent {
  final int id;
  DeleteTodoEvent(this.id);
  @override
  List<Object> get props => [id];
}

class GetAllTodos extends TodoEvent {
  @override
  List<Object?> get props => [];
}

class GetTodoByIdEvent extends TodoEvent {
  final int id;
  GetTodoByIdEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
