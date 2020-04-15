import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}
class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New todo',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
        
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Title"
          ),
          TextField(
            controller: controllerTitle,
            autofocus: true,
          ),
          Text(
            "Body",
          ),
          TextField(
            controller: controllerBody,
            autofocus: true,
          ),
        ]
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            final todo = new Todo(
              title: controllerTitle.value.text,
              body: controllerBody.value.text,
              completed: 0,
            );
            controllerTitle.clear();
            controllerBody.clear();
            Navigator.of(context).pop(todo);
          },

        ),
      ],
    );
  }
}
