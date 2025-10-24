import 'package:flutter_todo_vanilla/logic/todo_logic.dart';
import 'package:flutter_todo_vanilla/views/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ToDoApp());

class ToDoApp extends StatelessWidget {
  ToDoApp({super.key});

  final TodoController controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      title: 'ToDo App',
      home: ToDoHomePage(controller: controller),
    );
  }
}
