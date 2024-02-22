// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/counter.dart';
import 'package:flutter_application_1/pages/todo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class Tasks {
  String title;
  bool status;
  Tasks({required this.title, required this.status});
}

class _TodoAppState extends State<TodoApp> {
  List AllTasks = [
    Tasks(title: "play foot ball", status: true),
    Tasks(title: "call mom", status: true),
    Tasks(title: "do my job", status: true),
    Tasks(title: "Gem", status: true)
  ];
  changestatus(int taskIndex) {
    setState(() {
      AllTasks[taskIndex].status = !AllTasks[taskIndex].status;
    });
  }

  delete(int deletedTask) {
    setState(() {
      AllTasks.remove(AllTasks[deletedTask]);
    });
  }

  deleteAll() {
    setState(() {
      AllTasks.removeRange(0, AllTasks.length);
    });
  }

  addnewtask() {
    setState(() {
      AllTasks.add(Tasks(title: newtext.text, status: false));
    });
  }

  final newtext = TextEditingController();

  calctheDoneTasks() {
    int count = 0;
    for (var item in AllTasks) {
      if (item.status) {
        count++;
      }
    }

    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, .7),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    padding: EdgeInsets.all(22),
                    height: 200,
                    color: Colors.amber[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: newtext,
                          maxLength: 30,
                          decoration:
                              InputDecoration(labelText: "Add your task"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              addnewtask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 30, 39, 20)),
                            ))
                      ],
                    )),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.redAccent,
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(58, 66, 86, .7),
        actions: [
          IconButton(
            onPressed: () {
              deleteAll();
            },
            icon: Icon(Icons.delete_forever),
            iconSize: 40,
            color: Color.fromARGB(255, 236, 125, 125),
          )
        ],
        title: Text(
          "My ToDo App",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Counter(
              allTodos: AllTasks.length,
              allcombleted: calctheDoneTasks(),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 500,
              color: Color.fromARGB(255, 78, 87, 97),
              child: ListView.builder(
                itemCount: AllTasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return Todo_card(
                    vartitle: AllTasks[index].title,
                    doneORnot: AllTasks[index].status,
                    changestatus: changestatus,
                    index: index,
                    delete: delete,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
