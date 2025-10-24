import 'package:flutter_todo_vanilla/model/todo.dart';
import 'package:flutter/material.dart';

enum ToDoFilters { all, ongoing, completed }

class TodoController {
  // Reactive list of tasks
  final ValueNotifier<List<ToDo>> todos = ValueNotifier<List<ToDo>>([]);

  final ValueNotifier<ToDoFilters> filter = ValueNotifier<ToDoFilters>(ToDoFilters.all);

  final TextEditingController textController = TextEditingController();

  List<ToDo> get filterList {
    return todos.value.where((t) {
      switch (filter.value) {
        case ToDoFilters.ongoing:
          return t.done == false;
        case ToDoFilters.completed:
          return t.done == true;
        default:
          return true;
      }
    }).toList();
  }

  void addTask() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    final updated = List<ToDo>.from(todos.value);
    updated.add(ToDo(title: text));
    todos.value = updated;
    textController.clear();
  }

  void toggleDone(int index) {
    final updated = List<ToDo>.from(todos.value);
    updated[index].done = !updated[index].done;
    todos.value = updated;
  }

  void toggleFilter(ToDoFilters filter) {
    this.filter.value = filter;
  }

  void removeTodo(int index) {
    final updated = List<ToDo>.from(todos.value);
    updated.removeAt(index);
    todos.value = updated;
  }

  void dispose() {
    textController.dispose();
    todos.dispose();
  }
}
