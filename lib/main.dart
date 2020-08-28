import 'package:capacitaDeFlutter/src/screens/add_todo.dart';
import 'package:capacitaDeFlutter/src/screens/completed_todos.dart';
import 'package:capacitaDeFlutter/src/utils/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.ADD_TODO,
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
      ),
      routes: {
        AppRoutes.ADD_TODO: (_) => AddTodoScreen(),
        AppRoutes.COMPLETED_TODOS: (_) => CompletedTodosScreen(),
      },
    );
  }
}
