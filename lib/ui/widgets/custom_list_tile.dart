import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../entities/todo.dart';

class CustomListTile extends StatelessWidget {
  final Todo todo;
  final VoidCallback onIconButttonPressed;
  const CustomListTile({
    super.key, required this.todo, required this.onIconButttonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: _getColor(todo.isDone),
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: ListTile(
        title: Text(todo.title,style: TextStyle(
          decoration: _getTextDecoration(todo.isDone),
        ),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description),
            Text(DateFormat.yMEd().add_jms().format(todo.time)),
          ],
        ),
        trailing: _buildRoundedIconButton(todo.isDone),
      ),
    );
  }

  Widget _buildRoundedIconButton(bool isDone){
    return GestureDetector(
      onTap: onIconButttonPressed,
      child: CircleAvatar(
        child: Icon(_getIcon(!todo.isDone)),
      ),
    );
  }
  
  IconData _getIcon(bool isDone){
    return isDone?Icons.check:Icons.clear;
  }

  TextDecoration _getTextDecoration(bool isDone){
    return isDone?TextDecoration.lineThrough:TextDecoration.none;
  }

  Color _getColor(bool isDone){
    return isDone?Colors.teal:Colors.transparent;
  }
}