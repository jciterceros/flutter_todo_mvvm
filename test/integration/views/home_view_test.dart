import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/services/mock_todo_repository.dart';
import 'package:flutter_todo_mvvm/viewmodels/todo_viewmodel.dart';
import 'package:flutter_todo_mvvm/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  group('HomeView Tests', () {
    late TodoViewModel viewModel;

    setUp(() {
      viewModel = TodoViewModel(MockTodoRepository());
    });

    Widget createTestableWidget() {
      return ChangeNotifierProvider<TodoViewModel>(
        create: (_) => viewModel,
        child: const MaterialApp(home: HomeView()),
      );
    }

    testWidgets('should display app bar with correct title', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestableWidget());

      expect(find.text('Tarefas MVVM'), findsOneWidget);
    });

    testWidgets(
      'should display empty state message when no todos are present',
      (WidgetTester tester) async {
        await tester.pumpWidget(createTestableWidget());

        expect(find.text('Nenhuma tarefa encontrada'), findsOneWidget);
      },
    );

    testWidgets('should add a new todo when input is submitted', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestableWidget());

      final inputField = find.byType(TextField);
      final addButton = find.byIcon(Icons.add);

      await tester.enterText(inputField, 'New Todo');
      await tester.tap(addButton);
      await tester.pump();

      expect(viewModel.todos.any((todo) => todo.title == 'New Todo'), isTrue);
    });

    testWidgets('should reload todos when floating action button is pressed', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(createTestableWidget());

      final fab = find.byType(FloatingActionButton);

      await tester.tap(fab);
      await tester.pump();

      // Assuming loadTodos fetches some predefined todos
      expect(viewModel.todos.isNotEmpty, isTrue);
    });
  });
}
