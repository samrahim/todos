part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

class OperationSuccess extends TodoState {
  @override
  List<Object?> get props => [];
}

class OperationFailed extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodosLoadedState extends TodoState {
  final List<Map> list;
  TodosLoadedState(this.list);
  @override
  List<Object?> get props => [list];
}

class GetTodoByIdState extends TodoState {
  final Map<dynamic, dynamic> mp;
  GetTodoByIdState({required this.mp});

  @override
  List<Object?> get props => [mp];
}
