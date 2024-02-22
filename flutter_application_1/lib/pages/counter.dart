// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final allTodos;
  final  int allcombleted;
  

  const Counter({super.key, required this.allTodos, required this.allcombleted});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "$allcombleted/$allTodos",
        
        style: TextStyle(
            fontSize: 50, fontWeight: FontWeight.w600,color: allcombleted==allTodos? Color.fromARGB(255, 5, 240, 13): Colors.white),
           
      ),
    );
  }
}
