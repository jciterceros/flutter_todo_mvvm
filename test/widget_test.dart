import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_mvvm/views/widgets/todo_input.dart';

void main() {
  testWidgets('TodoInput widget adds a todo', (WidgetTester tester) async {
    String? addedTodo;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: TodoInput(onAdd: (todo) => addedTodo = todo)),
      ),
    );

    final textField = find.byType(TextField);
    await tester.enterText(textField, 'Widget Test Todo');
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(addedTodo, 'Widget Test Todo');
  });
}
