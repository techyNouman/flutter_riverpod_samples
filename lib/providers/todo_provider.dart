
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_samples/models/todo_item.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoItem>>((ref){
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<TodoItem>>{
  TodoNotifier() : super([]);

  void addTodoItem(String name){
    final todo = TodoItem(id: DateTime.now().toString(), name: name);
    state.add(todo);
    state = state.toList();
  }
  
  void deleteTodoItem(String id){
    state.removeWhere((todo) => todo.id == id);
    state = state.toList();
  }

  void updateTodoItem(String id, String name){
    final index = state.indexWhere((todo) => todo.id == id);
    state[index].name = name;
    state = state.toList();
  }

}