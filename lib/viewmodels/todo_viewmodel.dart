import 'package:flutter/foundation.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';

class TodoViewModel with ChangeNotifier {
  final TodoRepository repository;

  TodoViewModel(this.repository);

  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> loadTodos() async {
    _todos = await repository.fetchTodos();
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      completed: false,
    );
    await repository.addTodo(newTodo);
    _todos.add(newTodo);
    notifyListeners();
  }

  Future<void> toggleTodoCompletion(int id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final updatedTodo = _todos[index].copyWith(
        completed: !_todos[index].completed,
      );
      await repository.updateTodo(updatedTodo);
      _todos[index] = updatedTodo;
      notifyListeners();
    }
  }

  Future<void> removeTodo(int id) async {
    await repository.deleteTodoById(id);
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
