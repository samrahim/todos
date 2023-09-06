import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/repository/repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  Repository repository;
  TodoBloc(this.repository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      if (event is AddTodoEvent) {
        try {
          await repository.createTodo(
              "INSERT INTO 'todos1' ('title','subtitle','time') VALUES ('${event.title}','${event.subtitle}','${event.time}')");
          emit(OperationSuccess());
          List<Map> list = await repository.getTodos("SELECT * FROM 'todos1'");
          List<Map> ls = List.from(list);
          emit(TodosLoadedState(ls));
        } catch (e) {
          emit(OperationFailed());
          List<Map> list = await repository.getTodos("SELECT * FROM 'todos1'");
          List<Map> ls = List.from(list);
          emit(TodosLoadedState(ls));
        }
      }
      if (event is GetAllTodos) {
        List<Map> list = await repository.getTodos("SELECT * FROM 'todos1'");
        emit(TodosLoadedState(list));
      }
      if (event is DeleteTodoEvent) {
        try {
          await repository
              .deleteTodo("DELETE FROM 'todos1' WHERE id = ${event.id}");
          emit(OperationSuccess());
          List<Map> list = await repository.getTodos("SELECT * FROM 'todos1'");
          List<Map> ls = List.from(list);
          emit(TodosLoadedState(ls));
        } catch (e) {
          emit(OperationFailed());
        }
      }
      // if (event is UpdateTodoEvent) {
      //   repository.updateTodo("UPDATE 'todos1' SET 'title'='${event.title}'");
      // }
      if (event is GetTodoByIdEvent) {
        List<Map> list = await repository.getTodos("SELECT * FROM 'todos1'");
        Map mp = await repository.getTodobyid(list, event.id);
        emit(GetTodoByIdState(mp: mp));
      }
    });
  }
}
