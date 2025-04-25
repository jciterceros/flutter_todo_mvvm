import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';
import 'package:flutter_todo_mvvm/viewmodels/todo_viewmodel.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {
  @override
  Future<List<Todo>> fetchTodos() => super.noSuchMethod(
    Invocation.method(#fetchTodos, []),
    returnValue: Future.value(<Todo>[]),
    returnValueForMissingStub: Future.value(<Todo>[]),
  );
  @override
  Future<void> addTodo(Todo todo) => super.noSuchMethod(
    Invocation.method(#addTodo, [todo]),
    returnValue: Future.value(),
    returnValueForMissingStub: Future.value(),
  );
  @override
  Future<void> updateTodo(Todo todo) => super.noSuchMethod(
    Invocation.method(#updateTodo, [todo]),
    returnValue: Future.value(),
    returnValueForMissingStub: Future.value(),
  );
  @override
  Future<void> deleteTodoById(int id) => super.noSuchMethod(
    Invocation.method(#deleteTodoById, [id]),
    returnValue: Future.value(),
    returnValueForMissingStub: Future.value(),
  );
}

void main() {
  late TodoViewModel viewModel;
  late MockTodoRepository mockRepository;
  Todo createNewTodo() {
    return Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: 'Test Todo',
      completed: false,
    );
  }

  setUp(() {
    mockRepository = MockTodoRepository();
    viewModel = TodoViewModel(mockRepository);
  });

  group('TodoViewModel', () {
    test('should load todos from the repository', () async {
      final todoList = [createNewTodo(), createNewTodo()];
      when(mockRepository.fetchTodos()).thenAnswer((_) async => todoList);

      await viewModel.loadTodos();

      expect(viewModel.todos, todoList);
    });

    test('should add a new todo', () async {
      final newTodo = createNewTodo();
      when(mockRepository.addTodo(newTodo)).thenAnswer((_) async {});

      await viewModel.addTodo(newTodo.title);

      expect(viewModel.todos.length, 1);
      expect(viewModel.todos[0].title, newTodo.title);
    });

    test('should toggle todo completion', () async {
      final todo = createNewTodo();
      when(mockRepository.fetchTodos()).thenAnswer((_) async => [todo]);
      when(mockRepository.updateTodo(todo)).thenAnswer((_) async {});

      await viewModel.loadTodos();
      await viewModel.toggleTodoCompletion(todo.id);

      expect(viewModel.todos[0].completed, true);
    });
    test('should remove a todo', () async {
      final todo = createNewTodo();
      when(mockRepository.fetchTodos()).thenAnswer((_) async => [todo]);
      when(mockRepository.deleteTodoById(todo.id)).thenAnswer((_) async {});

      await viewModel.loadTodos();
      await viewModel.removeTodo(todo.id);

      expect(viewModel.todos.isEmpty, true);
    });

    test(
      'should not crash when toggling completion on an empty list',
      () async {
        await viewModel.toggleTodoCompletion(1); // No todo with id 1

        expect(viewModel.todos.isEmpty, true);
      },
    );
  });
}
