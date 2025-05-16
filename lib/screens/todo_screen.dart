import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/providers/todo_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Todo - State notifier provider")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(todoProvider.notifier).addTodoItem("New Todo Item");
        },
        child: Text('+'),
      ),
      body: todoList.isEmpty ? const Center(child: Text("No records found.")) : ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (ctx, i){
          final todoItem = todoList[i];
        return ListTile(
          title: Text(todoItem.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
                ref.read(todoProvider.notifier).updateTodoItem(todoItem.id, "Updated Todo Item");
              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: (){
                ref.read(todoProvider.notifier).deleteTodoItem(todoItem.id);
              }, icon: Icon(Icons.delete)),
            ],
          ),
        );
      }),
    );
  }
}
