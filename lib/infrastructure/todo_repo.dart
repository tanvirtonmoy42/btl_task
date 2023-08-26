import 'package:btl_task/domain/add_todo_model.dart';
import 'package:btl_task/domain/i_todo_repo.dart';
import 'package:btl_task/domain/todo_model.dart';
import 'package:clean_api/clean_api.dart';

class TodoRepo extends ITodoRepo {
  final cleanApi = CleanApi.instance;
  @override
  Future<Either<CleanFailure, Unit>> addTodo(
      {required AddTodoModel todo}) async {
    return cleanApi.post(
      body: todo.toMap(),
      fromData: (json) => unit,
      endPoint: 'todos',
    );
  }

  @override
  Future<Either<CleanFailure, Unit>> deleteTodo({required String id}) async {
    return cleanApi.delete(fromData: (json) => unit, endPoint: 'todos/$id');
  }

  @override
  Future<Either<CleanFailure, TodoModel>> getTodoById(
      {required String id}) async {
    return cleanApi.get(
      fromData: (json) => TodoModel.fromMap(json['data']),
      endPoint: 'todos/$id',
    );
  }

  @override
  Future<Either<CleanFailure, List<TodoModel>>> getTodos() async {
    return cleanApi.get(
      fromData: (json) => List<TodoModel>.from(
              json['items'].map((item) => TodoModel.fromMap(item)))
          .reversed
          .toList(),
      endPoint: 'todos',
    );
  }

  @override
  Future<Either<CleanFailure, Unit>> updateTodo(
      {required AddTodoModel todo, required String id}) async {
    return cleanApi.put(
      body: todo.toMap(),
      fromData: (json) => unit,
      endPoint: 'todos/$id',
    );
  }
}
