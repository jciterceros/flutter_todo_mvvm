import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/local_todo_repository.dart';

void main() {
  late LocalTodoRepository repository;

  setUp(() {
    repository = LocalTodoRepository();
  });

  group('LocalTodoRepository', () {
    test('fetchTodos should return an empty list initially', () async {
      final todos = await repository.fetchTodos();
      expect(todos, isEmpty);
    });

    test('addTodo should add a todo to the repository', () async {
      final todo = Todo(id: 1, title: 'Test Todo', completed: false);

      await repository.addTodo(todo);
      final todos = await repository.fetchTodos();

      expect(todos, contains(todo));
    });

    test('updateTodo should update an existing todo', () async {
      final todo = Todo(id: 1, title: 'Test Todo', completed: false);

      await repository.addTodo(todo);

      final updatedTodo = Todo(id: 1, title: 'Updated Todo', completed: true);

      await repository.updateTodo(updatedTodo);
      final todos = await repository.fetchTodos();

      expect(todos.length, 1);
      expect(todos.first.title, 'Updated Todo');
      expect(todos.first.completed, true);
    });

    test('deleteTodoById should remove the todo with the given id', () async {
      final todo1 = Todo(id: 1, title: 'Test Todo 1', completed: false);

      final todo2 = Todo(id: 2, title: 'Test Todo 2', completed: false);

      await repository.addTodo(todo1);
      await repository.addTodo(todo2);

      await repository.deleteTodoById(1);
      final todos = await repository.fetchTodos();

      expect(todos.length, 1);
      expect(todos.first.id, 2);
    });

    test('deleteTodoById should do nothing if the id does not exist', () async {
      final todo = Todo(id: 1, title: 'Test Todo', completed: false);

      await repository.addTodo(todo);
      await repository.deleteTodoById(2);
      final todos = await repository.fetchTodos();

      expect(todos.length, 1);
      expect(todos.first.id, 1);
    });
  });
}
