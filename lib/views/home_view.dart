import 'package:flutter/material.dart';
import 'package:flutter_todo_mvvm/views/widgets/todo_input.dart';
import 'package:flutter_todo_mvvm/views/widgets/todo_item.dart';
import 'package:provider/provider.dart';
import '../viewmodels/todo_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Carrega as tarefas ao iniciar a tela
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoViewModel>(context, listen: false).loadTodos();
    });
  }

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
