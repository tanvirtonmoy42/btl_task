import 'package:btl_task/domain/add_todo_model.dart';
import 'package:btl_task/domain/todo_model.dart';
import 'package:clean_api/clean_api.dart';

abstract class ITodoRepo {
  Future<Either<CleanFailure, List<TodoModel>>> getTodos();
  Future<Either<CleanFailure, TodoModel>> getTodoById({required String id});
  Future<Either<CleanFailure, Unit>> addTodo({required AddTodoModel todo});
  Future<Either<CleanFailure, Unit>> updateTodo(
      {required AddTodoModel todo, required String id});
  Future<Either<CleanFailure, Unit>> deleteTodo({required String id});
}
