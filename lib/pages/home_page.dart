import 'package:f_202010_todo_class/model/todo.dart';
import 'package:f_202010_todo_class/pages/dialogo.dart';
import 'package:flutter/material.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list(){
      return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, posicion) {
        var element = todos[posicion];
        return _item(element, posicion);
      },
    );
  }

  Widget _item(Todo element, int posicion){
    // return Text('$posicion');
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        child: Card(
          color: element.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
          child: ListTile(
            onTap: (){_toque(context, posicion);},
            title: Text(
              element.title.toString()
            ),
            subtitle: Text(
              element.body.toString()
            ),
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            todos.removeAt(posicion);
          });

          Scaffold.of(context).showSnackBar(SnackBar(content: Text("$posicion dismissed")));
        },
        background: Container(color: Colors.red),
      ),
    );
  }

   _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );

    if (todo != null) {
      setState(() {
        this.todos.add(todo);
      });
    }
  }


  void _toque(BuildContext context, int posicion) {
    setState(() {
      if (this.todos[posicion].completed == 0) {
        this.todos[posicion].completed = 1;
      }
    });
  }

}