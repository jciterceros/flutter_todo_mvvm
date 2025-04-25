import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';

class MockTodoRepository implements TodoRepository {
  final List<Todo> _mockTodos = [
    Todo(id: 1, title: 'Aprender Flutter', completed: false),
    Todo(id: 2, title: 'Implementar MVVM', completed: false),
    Todo(id: 3, title: 'Testar aplicação', completed: true),
  ];

  @override
  Future<List<Todo>> fetchTodos() async {
    return Future.value(_mockTodos);
  }

  @override
  Future<void> addTodo(Todo todo) async {
    _mockTodos.add(todo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final index = _mockTodos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _mockTodos[index] = todo;
    }
  }

  @override
  Future<void> deleteTodoById(int id) async {
    _mockTodos.removeWhere((todo) => todo.id == id);
  }
}
