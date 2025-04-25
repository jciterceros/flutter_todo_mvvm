import 'package:flutter/material.dart';
import 'package:flutter_todo_mvvm/services/mock_todo_repository.dart';
import 'package:flutter_todo_mvvm/services/todo_repository.dart';
import 'package:flutter_todo_mvvm/utils/logger.dart';
import 'package:flutter_todo_mvvm/viewmodels/todo_viewmodel.dart';
import 'package:flutter_todo_mvvm/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  final TodoRepository todoRepository;
  try {
    todoRepository = MockTodoRepository();
    Logger.logInfo('Carregando tarefas...');
  } catch (e) {
    Logger.logError('Erro ao inicializar o repositório: $e');
    return;
  }

  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoViewModel(todoRepository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo MVVM',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeView(),
    );
  }
}
