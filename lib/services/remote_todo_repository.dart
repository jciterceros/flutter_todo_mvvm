import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';

class RemoteTodoRepository implements TodoRepository {
  @override
  Future<List<Todo>> fetchTodos() async {
    // Simula uma chamada de API
    return [];
  }

  @override
  Future<void> addTodo(Todo todo) async {
    // Simula uma chamada de API para adicionar uma tarefa
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // Simula uma chamada de API para atualizar uma tarefa
  }

  @override
  Future<void> deleteTodoById(int id) async {
    // Simula uma chamada de API para deletar uma tarefa
  }
}
