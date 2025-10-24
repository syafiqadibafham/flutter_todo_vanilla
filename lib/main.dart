import 'package:flutter_todo_vanilla/views/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ToDoApp());

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      title: 'ToDo App',
      home: ToDoHomePage(),
    );
  }
}
