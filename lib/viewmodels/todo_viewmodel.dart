import 'package:flutter/foundation.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';

class TodoViewModel with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  // Carrega tarefas (simulando chamada API)
  Future<void> loadTodos() async {
    // Simula delay de rede
    await Future.delayed(const Duration(seconds: 1));

    // Dados mockados
    _todos = [
      Todo(id: 1, title: 'Aprender Flutter', completed: false),
      Todo(id: 2, title: 'Implementar MVVM', completed: false),
      Todo(id: 3, title: 'Testar aplicação', completed: true),
    ];

    notifyListeners();
  }

  // Adiciona nova tarefa
  void addTodo(String title) {
    final newTodo = Todo(id: _todos.length + 1, title: title, completed: false);
    _todos.add(newTodo);
    notifyListeners();
  }

  // Alterna status de completado
  void toggleTodoCompletion(int id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = _todos[index].copyWith(
        completed: !_todos[index].completed,
      );
      notifyListeners();
    }
  }

  // Remove tarefa
  void removeTodo(int id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
