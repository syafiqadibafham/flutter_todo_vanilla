import 'package:flutter/material.dart';
import 'package:flutter_todo_vanilla/logic/todo_logic.dart';

class ToDoHomePage extends StatelessWidget {
  final TodoController controller = TodoController();

  ToDoHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDo App')),
      body: ValueListenableBuilder(
        valueListenable: controller.filter,
        builder: (context, filter, child) {
          return Column(
            spacing: 8,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.textController,
                        decoration: const InputDecoration(labelText: 'Neue Aufgabe'),
                        onSubmitted: (_) => controller.addTask(),
                      ),
                    ),
                    IconButton(icon: const Icon(Icons.add), onPressed: () => controller.addTask()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...ToDoFilters.values.map((e) {
                    final isSelected = filter == e;
                    return InkWell(
                      onTap: () {
                        controller.toggleFilter(e);
                        filter = e;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2, color: isSelected ? Theme.of(context).colorScheme.primary : Colors.transparent)),
                        ),
                        child: Text(e.name.toUpperCase(), style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                      ),
                    );
                  }),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ValueListenableBuilder(
                    valueListenable: controller.todos,
                    builder: (context, value, child) {
                      final todos = controller.filterList;
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todos[index];
                          return Card(
                            color: Theme.of(context).colorScheme.onSecondary,
                            child: ListTile(
                              title: Text(todo.title, style: TextStyle(decoration: todo.done ? TextDecoration.lineThrough : null)),
                              leading: Checkbox(value: todo.done, onChanged: (_) => controller.toggleDone(index)),
                              trailing: IconButton(icon: const Icon(Icons.delete), onPressed: () => controller.removeTodo(index)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
