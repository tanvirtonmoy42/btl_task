import 'package:btl_task/application/todo_provider.dart';
import 'package:btl_task/domain/add_todo_model.dart';
import 'package:btl_task/domain/todo_model.dart';
import 'package:btl_task/presentation/add_edit_todo_page.dart';
import 'package:btl_task/presentation/todo_details_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TodoTile extends ConsumerWidget {
  final TodoModel todo;
  const TodoTile({super.key, required this.todo});

  @override
  Widget build(BuildContext context, ref) {
    return Material(
      borderRadius: BorderRadius.circular(10.sp),
      elevation: 2,
      child: ListTile(
        onTap: () {
          ref.invalidate(todoDetailsProvider(todo.id));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TodoDetailsPage(id: todo.id)));
        },
        tileColor: Theme.of(context).colorScheme.primary.withOpacity(.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        title: Text(todo.title),
        subtitle: Text(
          todo.isCompleted ? 'Completed' : 'Pending',
          style: TextStyle(
            fontSize: 16.sp,
            color: todo.isCompleted ? Colors.greenAccent : Colors.yellow,
          ),
        ),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 1) {
              showDialog(
                  context: context,
                  builder: (context) => AddEditTodoPage(todo: todo));
            } else if (value == 2) {
              final addTodo = AddTodoModel(
                  title: todo.title,
                  description: todo.description,
                  isCompleted: !todo.isCompleted);
              ref.read(todoProvider).updateTodo(todo: addTodo, id: todo.id);
              return ref.refresh(todoListProvider);
            } else if (value == 3) {
              ref.read(todoProvider).deleteTodo(id: todo.id);
              return ref.refresh(todoListProvider);
            }
          },
          color: Colors.white,
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem(
              value: 1,
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 2,
              child: Text(
                  todo.isCompleted ? 'Mark as Pending' : 'Mark as Completed'),
            ),
            const PopupMenuItem(
              value: 3,
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
