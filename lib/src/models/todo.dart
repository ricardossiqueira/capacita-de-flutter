import 'package:flutter/foundation.dart';

class Todo {
  int id;
  String title;
  String body;
  bool done;
  DateTime createdAt;
  DateTime completedAt;

  Todo({
    @required this.id,
    @required this.title,
    @required this.body,
    this.done = false,
    @required this.createdAt,
    this.completedAt,
  });
}
