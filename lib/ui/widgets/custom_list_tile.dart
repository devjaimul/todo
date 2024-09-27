import 'package:flutter/material.dart';

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
            Text(todo.time.toString()),
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
        child: Icon(_getIcon(true)),
      ),
    );
  }
  
  IconData _getIcon(bool isDone){
    return isDone?Icons.check:Icons.clear;
  }

  TextDecoration _getTextDecoration(bool isDone){
    return isDone?TextDecoration.lineThrough:TextDecoration.none;
  }
}