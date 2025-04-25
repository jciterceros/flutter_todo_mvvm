import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';

class MockTodoRepository implements TodoRepository {
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
    _todos.removeWhere((t) => t.id == id);
  }
}

void main() {
  late MockTodoRepository todoRepository;

  setUp(() {
    todoRepository = MockTodoRepository();
  });

  test('fetchTodos should return an empty list initially', () async {
    final todos = await todoRepository.fetchTodos();
    expect(todos, isEmpty);
  });

  test('addTodo should add a todo to the repository', () async {
    final todo = Todo(id: 1, title: 'Test Todo', completed: false);

    await todoRepository.addTodo(todo);
    final todos = await todoRepository.fetchTodos();

    expect(todos.length, 1);
    expect(todos.first, todo);
  });

  test('updateTodo should update an existing todo', () async {
    final todo = Todo(id: 1, title: 'Test Todo', completed: false);

    await todoRepository.addTodo(todo);

    final updatedTodo = Todo(id: 1, title: 'Updated Todo', completed: true);

    await todoRepository.updateTodo(updatedTodo);
    final todos = await todoRepository.fetchTodos();

    expect(todos.length, 1);
    expect(todos.first.title, 'Updated Todo');
    expect(todos.first.completed, true);
  });

  test('deleteTodoById should remove a todo by its id', () async {
    final todo = Todo(id: 1, title: 'Test Todo', completed: false);

    await todoRepository.addTodo(todo);
    await todoRepository.deleteTodoById(1);
    final todos = await todoRepository.fetchTodos();

    expect(todos, isEmpty);
  });
}
