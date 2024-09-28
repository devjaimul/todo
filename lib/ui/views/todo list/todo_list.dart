import 'package:flutter/material.dart';
import 'package:todo/ui/views/add_new_todo_screen.dart';
import 'package:todo/ui/views/todo%20list/all_todo_list.dart';
import 'package:todo/ui/views/todo%20list/unDone_todo_list.dart';

import '../../../entities/todo.dart';
import 'done_todo_list.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _todoList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: _buildTabBar(),
        ),
        body: TabBarView(children: [
          AllTodoList(
              onChangedStatus: _toggleTodoStatus,
              onDelete: _deleteTodo,
              todoList: _todoList),
          UnDoneTodoList(
              onChangedStatus: _toggleTodoStatus,
              OnDelete: _deleteTodo,
              todoList: _todoList.where((item) => item.isDone==false ,).toList()),
          DoneTodoList(
              onChangedStatus: _toggleTodoStatus,
              OnDelete: _deleteTodo,
              todoList: _todoList.where((item) => item.isDone==true ,).toList()),
        ]),
        floatingActionButton: _addTodoFav(),
      ),
    );
  }

  FloatingActionButton _addTodoFav() {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTodoScreen(onAddTodo:_addNewTodo,),
            ));
      },
      label: const Text('Add'),
      icon: const Icon(Icons.add),
      tooltip: 'Add New Todo',
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white.withOpacity(0.5),
        indicatorColor: Colors.teal,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.grey,
        tabs: const [
          Tab(
            child: Text('All'),
          ),
          Tab(
            child: Text('Undone'),
          ),
          Tab(
            child: Text('Done'),
          ),
        ]);
  }

  void _addNewTodo(Todo todo) {
    _todoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _deleteTodo(int index) {
    _todoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleTodoStatus(int index) {
    _todoList[index].isDone = !_todoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}
