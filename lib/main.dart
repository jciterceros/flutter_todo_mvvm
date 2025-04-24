import 'package:flutter/material.dart';
import 'package:flutter_todo_mvvm/viewmodels/todo_viewmodel.dart';
import 'package:flutter_todo_mvvm/views/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoViewModel(),
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
      title: 'MVVM Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TodoScreen(),
    );
  }
}
