import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List'),),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Text"),
            subtitle: Column(
              children: [
                Text('Description'),
                Text('Time'),
              ],
            ),

          );
        },),
    );
  }
}
