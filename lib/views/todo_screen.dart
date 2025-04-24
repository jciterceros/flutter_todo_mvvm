import 'package:flutter/material.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_viewmodel.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas MVVM')),
      body: Column(
        children: [
          // Formulário para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TodoInput(onAdd: viewModel.addTodo),
          ),
          // Lista de tarefas
          Expanded(
            child:
                viewModel.todos.isEmpty
                    ? const Center(child: Text('Nenhuma tarefa encontrada'))
                    : ListView.builder(
                      itemCount: viewModel.todos.length,
                      itemBuilder: (context, index) {
                        final todo = viewModel.todos[index];
                        return TodoItem(
                          todo: todo,
                          onToggle: viewModel.toggleTodoCompletion,
                          onRemove: viewModel.removeTodo,
                        );
                      },
                    ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.loadTodos,
        tooltip: 'Recarregar',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// Componente para entrada de nova tarefa
class TodoInput extends StatefulWidget {
  final Function(String) onAdd;

  const TodoInput({super.key, required this.onAdd});

  @override
  State<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends State<TodoInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Nova tarefa',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (_controller.text.isNotEmpty) {
              widget.onAdd(_controller.text);
              _controller.clear();
            }
          },
        ),
      ],
    );
  }
}

// Componente para item da lista
class TodoItem extends StatelessWidget {
  final Todo todo;
  final Function(int) onToggle;
  final Function(int) onRemove;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (_) => onToggle(todo.id),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onRemove(todo.id),
      ),
    );
  }
}
