import 'package:flutter/material.dart';
import 'package:todo/ui/widgets/custom_list_tile.dart';
import 'package:todo/ui/widgets/empty_list.dart';

import '../../../entities/todo.dart';

class UnDoneTodoList extends StatelessWidget {
  const UnDoneTodoList(
      {super.key,
      required this.onChangedStatus,
      required this.OnDelete,
      required this.todoList});
  final Function(int) onChangedStatus;
  final Function(int) OnDelete;
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
            onDismissed: (_) {
              OnDelete(index);
            },
            child: CustomListTile(
              todo: todoList[index],
              onIconButttonPressed: () {
                onChangedStatus(index);
              },
            ));
      },
    );
  }
}
