import 'package:btl_task/application/todo_provider.dart';
import 'package:btl_task/domain/add_todo_model.dart';
import 'package:btl_task/domain/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddEditTodoPage extends HookConsumerWidget {
  final TodoModel? todo;
  const AddEditTodoPage({super.key, this.todo});

  @override
  Widget build(BuildContext context, ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController =
        useTextEditingController(text: todo != null ? todo!.title : '');
    final descController =
        useTextEditingController(text: todo != null ? todo!.description : '');
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 5.w),
      title: Text(
        todo == null ? 'Add a Task' : 'Edit Task',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
      content: SizedBox(
        width: 90.w,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    isDense: true,
                    hintText: 'Title',
                    labelText: 'Title',
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: 2.h),
                TextFormField(
                  controller: descController,
                  minLines: 4,
                  maxLines: 6,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Description';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    hintText: 'Description',
                    labelText: 'Description',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (todo == null) {
                // ----- on add ------ //
                final addTodo = AddTodoModel(
                    title: titleController.text,
                    description: descController.text,
                    isCompleted: false);
                ref.read(todoProvider).addTodo(todo: addTodo);
                Navigator.of(context).pop();
              } else {
                // ----- on edit ------ //
                final addTodo = AddTodoModel(
                    title: titleController.text,
                    description: descController.text,
                    isCompleted: todo!.isCompleted);
                ref.read(todoProvider).updateTodo(todo: addTodo, id: todo!.id);
                ref.invalidate(todoDetailsProvider(todo!.id));
                Navigator.of(context).pop();
              }
              ref.invalidate(todoListProvider);
            }
          },
          child: Text(todo == null ? 'Add Task' : 'Update'),
        ),
      ],
    );
  }
}
