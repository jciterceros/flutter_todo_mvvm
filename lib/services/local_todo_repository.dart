import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';

class LocalTodoRepository implements TodoRepository {
  final List<Todo> _todos = [];

  @override
  Future<List<Todo>> fetchTodos() async {
    return _todos;
  }

  @override
  Future<void> addTodo(Todo todo) async {
    _todos.add(todo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
  }

  @override
  Future<void> deleteTodoById(int id) async {
    _todos.removeWhere((todo) => todo.id == id);
  }
}
