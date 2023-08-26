import 'package:btl_task/application/todo_provider.dart';
import 'package:btl_task/presentation/add_edit_todo_page.dart';
import 'package:btl_task/presentation/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      // add task button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddEditTodoPage(),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add),
      ),
      // body
      body: todoList.when(
        data: (data) => ListView.separated(
          itemCount: data.length,
          padding:
              EdgeInsets.only(left: 2.w, right: 2.w, top: 1.h, bottom: 10.h),
          itemBuilder: (context, index) => TodoTile(
            todo: data[index],
          ),
          separatorBuilder: (context, index) => SizedBox(height: .5.h),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(
          child: Text(e.toString()),
        ),
      ),
    );
  }
}
