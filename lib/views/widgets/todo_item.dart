import 'package:flutter/material.dart';
import 'package:flutter_todo_mvvm/models/todo.dart';

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
