import 'package:flutter/material.dart';

import '../../entities/todo.dart';
import '../widgets/custom_list_tile.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todoList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List'),),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return CustomListTile(todo: Todo("Title", 'decription', DateTime.now()),onIconButttonPressed: (){},);
        },),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},
        label: Text('Add'),icon: Icon(Icons.add),tooltip: 'Add New Todo',),
    );
  }
}


