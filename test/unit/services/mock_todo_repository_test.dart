import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/mock_todo_repository.dart';

void main() {
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
  });

  group('MockTodoRepository', () {
    test('fetchTodos should return all mock todos', () async {
      final todos = await mockTodoRepository.fetchTodos();
      expect(todos.length, 3);
      expect(todos[0].title, 'Aprender Flutter');
    });

    test('addTodo should add a new todo to the list', () async {
      final newTodo = Todo(id: 4, title: 'Escrever testes', completed: false);
      await mockTodoRepository.addTodo(newTodo);

      final todos = await mockTodoRepository.fetchTodos();
      expect(todos.length, 4);
      expect(todos.last.title, 'Escrever testes');
    });

    test('updateTodo should update an existing todo', () async {
      final updatedTodo = Todo(
        id: 1,
        title: 'Aprender Flutter Avançado',
        completed: true,
      );
      await mockTodoRepository.updateTodo(updatedTodo);

      final todos = await mockTodoRepository.fetchTodos();
      expect(todos[0].title, 'Aprender Flutter Avançado');
      expect(todos[0].completed, true);
    });

    test('deleteTodoById should remove a todo by its id', () async {
      await mockTodoRepository.deleteTodoById(1);

      final todos = await mockTodoRepository.fetchTodos();
      expect(todos.length, 2);
      expect(todos.any((todo) => todo.id == 1), false);
    });

    test('deleteTodoById should do nothing if id does not exist', () async {
      await mockTodoRepository.deleteTodoById(99);

      final todos = await mockTodoRepository.fetchTodos();
      expect(todos.length, 3);
    });
  });
}
