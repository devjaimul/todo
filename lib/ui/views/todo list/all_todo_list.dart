import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/custom_list_tile.dart';

import '../../../entities/todo.dart';
import '../../widgets/empty_list.dart';

class AllTodoList extends StatelessWidget {
  const AllTodoList({super.key, required this.onChangedStatus, required this.onDelete, required this.todoList});

  final Function(int) onChangedStatus;
  final Function(int) onDelete;
  final List<Todo> todoList;

  @override
  Widget build(BuildContext context) {
    if(todoList.isEmpty){
      return EmptyList();
    }
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
            key: UniqueKey(),
            onDismissed: (_){
              onDelete(index);
            },
            child: CustomListTile(todo: todoList[index],onIconButttonPressed: (){
              onChangedStatus(index);
            },));
      },);
  }
}
