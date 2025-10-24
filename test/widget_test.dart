import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_vanilla/logic/todo_logic.dart';
import 'package:flutter_todo_vanilla/views/home_page.dart';

void main() {
  testWidgets('ToDoHomePage Widget Test', (WidgetTester tester) async {
    // Create a TodoController.
    final controller = TodoController();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ToDoHomePage(controller: controller),
    ));

    // Verify that the initial UI is correct.
    expect(find.text('ToDo App'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Card), findsNothing);

    // Add a new task.
    await tester.enterText(find.byType(TextField), 'Test Task 1');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the new task is added to the list.
    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Test Task 1'), findsOneWidget);

    // Add another task.
    await tester.enterText(find.byType(TextField), 'Test Task 2');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the second task is also in the list.
    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsOneWidget);

    // Toggle the first task to mark it as done.
    await tester.tap(find.byType(Checkbox).first);
    await tester.pump();

    // Verify that the first task is marked as done.
    expect(tester.widget<Checkbox>(find.byType(Checkbox).first).value, isTrue);

    // Filter to show only completed tasks.
    await tester.tap(find.text('COMPLETED'));
    await tester.pump();

    // Verify that only the completed task is visible.
    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsNothing);

    // Filter to show only ongoing tasks.
    await tester.tap(find.text('ONGOING'));
    await tester.pump();

    // Verify that only the ongoing task is visible.
    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Test Task 1'), findsNothing);
    expect(find.text('Test Task 2'), findsOneWidget);

    // Filter to show all tasks.
    await tester.tap(find.text('ALL'));
    await tester.pump();

    // Verify that both tasks are visible again.
    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsOneWidget);

    // Delete the first task.
    await tester.tap(find.byIcon(Icons.delete).first);
    await tester.pump();

    // Verify that the first task is removed.
    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Test Task 1'), findsNothing);
    expect(find.text('Test Task 2'), findsOneWidget);

    // Dispose the controller.
    controller.dispose();
  });
}
