import 'package:flutter/material.dart';

class CompletedTodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Completed todos"),
      ),
      body: Center(
        child: Text("coisas pra fazer"),
      ),
    );
  }
}
