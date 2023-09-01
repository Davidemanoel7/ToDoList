import 'package:flutter/material.dart';


class MyHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome> {
  
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();
  final tasks = <String>[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('To Do List'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 20
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 32, 24, 32),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: taskController,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black87
                      ),
                      decoration: const InputDecoration(
                        hintText: 'type a new task',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.black38
                        )
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.trim().isEmpty){
                          return 'Task filed it\'s required';
                        }
                        return null;
                      },
                    )
                  ),
                  Container(
                    // margin: EdgeInsets.fromLTRB(16, 0, 24, 0),
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          setState(() {
                            tasks.add(taskController.text);
                          });
                          taskController.clear();
                        }
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                      ),
                    )
                  ),
                ],
              )
            ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: 
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 0),                            
                            child: Text(tasks[index])
                        ) 
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tasks.remove(tasks[index]);
                            });
                          },
                          child: Container(
                            margin: EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 0),
                            height: 48,
                            child: Icon(
                              Icons.delete,
                              color: Colors.redAccent,
                            )
                          ),
                        )
                      ],
                    )
                  );
                },
              ) 
            ),
          ],
        ),
      ),
    );
 } 
}