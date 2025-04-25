import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';

void main() {
  group('Todo Model', () {
    test('should create a Todo object', () {
      final todo = Todo(id: 1, title: 'Test Todo', completed: false);

      expect(todo.id, 1);
      expect(todo.title, 'Test Todo');
      expect(todo.completed, false);
    });

    test('copyWith should return a new Todo object with updated fields', () {
      final todo = Todo(id: 1, title: 'Test Todo', completed: false);

      final updatedTodo = todo.copyWith(title: 'Updated Todo', completed: true);

      expect(updatedTodo.id, 1); // id should remain unchanged
      expect(updatedTodo.title, 'Updated Todo');
      expect(updatedTodo.completed, true);
    });

    test('copyWith should return the same object if no fields are updated', () {
      final todo = Todo(id: 1, title: 'Test Todo', completed: false);

      final sameTodo = todo.copyWith();

      expect(sameTodo.id, todo.id);
      expect(sameTodo.title, todo.title);
      expect(sameTodo.completed, todo.completed);
    });
  });
}
