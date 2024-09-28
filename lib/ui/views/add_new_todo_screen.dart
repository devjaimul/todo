import 'package:flutter/material.dart';
import 'package:todo/entities/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.onAddTodo});
final Function(Todo) onAddTodo;
  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController titleTEController=TextEditingController();
  final TextEditingController desTEController=TextEditingController();
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(

            children: [

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: titleTEController,
                decoration: InputDecoration(
                  labelText: "Title"
                ),
                validator: (String? value) {
                  if(value?.trim().isEmpty?? true){
                    return "Enter Your Title";
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: desTEController,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: "Description"
                ),
                validator: (String? value) {
                  if(value?.trim().isEmpty?? true){
                    return "Enter Your Description";
                  }
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){

                  Todo todo=Todo(titleTEController.text.trim(), desTEController.text.trim(), DateTime.now());
                  widget.onAddTodo(todo);
                  Navigator.pop(context);
                }
              }, child: Text('Add')),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleTEController.dispose();
    desTEController.dispose();
  }
}
