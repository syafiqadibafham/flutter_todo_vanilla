import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_vanilla/logic/todo_logic.dart';
import 'package:flutter_todo_vanilla/model/todo.dart';

void main() {
  group('TodoController', () {
    late TodoController todoController;

    setUp(() {
      todoController = TodoController();
    });

    test('Initial values are correct', () {
      expect(todoController.todos.value, []);
      expect(todoController.filter.value, ToDoFilters.all);
    });

    test('addTask adds a new todo', () {
      todoController.textController.text = 'Test Task';
      todoController.addTask();
      expect(todoController.todos.value.length, 1);
      expect(todoController.todos.value.first.title, 'Test Task');
      expect(todoController.textController.text, '');
    });

    test('addTask does not add an empty todo', () {
      todoController.textController.text = '  ';
      todoController.addTask();
      expect(todoController.todos.value.isEmpty, isTrue);
    });

    test('toggleDone toggles the done status of a todo', () {
      todoController.todos.value = [ToDo(title: 'Test Task')];
      expect(todoController.todos.value.first.done, isFalse);
      todoController.toggleDone(0);
      expect(todoController.todos.value.first.done, isTrue);
      todoController.toggleDone(0);
      expect(todoController.todos.value.first.done, isFalse);
    });

    test('removeTodo removes a todo from the list', () {
      todoController.todos.value = [ToDo(title: 'Test Task')];
      expect(todoController.todos.value.length, 1);
      todoController.removeTodo(0);
      expect(todoController.todos.value.isEmpty, isTrue);
    });

    test('toggleFilter changes the filter value', () {
      expect(todoController.filter.value, ToDoFilters.all);
      todoController.toggleFilter(ToDoFilters.completed);
      expect(todoController.filter.value, ToDoFilters.completed);
    });

    group('filterList', () {
      setUp(() {
        todoController.todos.value = [
          ToDo(title: 'Task 1', done: false),
          ToDo(title: 'Task 2', done: true),
          ToDo(title: 'Task 3', done: false),
        ];
      });

      test('returns all todos when filter is all', () {
        todoController.filter.value = ToDoFilters.all;
        expect(todoController.filterList.length, 3);
      });

      test('returns only ongoing todos when filter is ongoing', () {
        todoController.filter.value = ToDoFilters.ongoing;
        final filteredList = todoController.filterList;
        expect(filteredList.length, 2);
        expect(filteredList.every((todo) => !todo.done), isTrue);
      });

      test('returns only completed todos when filter is completed', () {
        todoController.filter.value = ToDoFilters.completed;
        final filteredList = todoController.filterList;
        expect(filteredList.length, 1);
        expect(filteredList.every((todo) => todo.done), isTrue);
      });
    });

    tearDown(() {
      todoController.dispose();
    });
  });
}