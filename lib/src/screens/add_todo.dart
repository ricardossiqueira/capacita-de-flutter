import 'package:capacitaDeFlutter/src/models/todo.dart';
import 'package:capacitaDeFlutter/src/utils/routes.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  List<Todo> _todos = [
    Todo(
      id: 1,
      title: "Primeira todo",
      body: "primeira todo",
      createdAt: DateTime.now(),
    )
  ];

  void _handleAddTodo(String title, String body) {
    setState(() {
      _todos = [
        ..._todos,
        Todo(
          id: _todos.length + 1,
          title: title,
          body: body,
          createdAt: DateTime.now(),
        )
      ];
    });
  }

  void _openFormModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: MediaQuery.of(context).size.width * 0.05,
          left: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Wrap(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Titulo"),
                    controller: _titleController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Descrição"),
                    controller: _bodyController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text("Adicionar"),
                        onPressed: () => _handleAddTodo(
                          _titleController.text,
                          _bodyController.text,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateCompletedTodosScreen() {
    Navigator.pushNamed(context, AppRoutes.COMPLETED_TODOS);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _navigateCompletedTodosScreen,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _todos
              .map(
                (todo) => ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Text(todo.id.toString()),
                  ),
                  title: Text(todo.title),
                  subtitle: Text(todo.body),
                  trailing: IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {},
                  ),
                ),
              )
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openFormModal(context),
      ),
    );
  }
}
