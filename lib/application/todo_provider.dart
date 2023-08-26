import 'package:btl_task/domain/i_todo_repo.dart';
import 'package:btl_task/domain/todo_model.dart';
import 'package:btl_task/infrastructure/todo_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoProvider = Provider<ITodoRepo>((ref) => TodoRepo());

final todoListProvider = FutureProvider<List<TodoModel>>((ref) async {
  final data = await ref.read(todoProvider).getTodos();
  return data.fold((l) => [], (r) => r);
});

final todoDetailsProvider =
    FutureProvider.family<TodoModel, String>((ref, id) async {
  final data = await ref.read(todoProvider).getTodoById(id: id);
  return data.fold((l) => TodoModel.none(), (r) => r);
});
