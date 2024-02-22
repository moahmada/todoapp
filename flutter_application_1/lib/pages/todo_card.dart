// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class Todo_card extends StatelessWidget {
  final String vartitle;
  final bool doneORnot;
  final Function changestatus;
  final int index;
  final Function delete;
  const Todo_card(
      {super.key,
      required this.vartitle,
      required this.doneORnot,
      required this.changestatus,
      required this.index,
      required this.delete});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changestatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: .9,
        child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromRGBO(209, 224, 224, .2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(vartitle,
                  style: TextStyle(
                      fontSize: 30,
                      color: doneORnot
                          ? Color.fromARGB(135, 12, 3, 3)
                          : Colors.white,
                      decoration: doneORnot
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              Row(
                children: [
                  Icon(doneORnot ? Icons.check : Icons.close,
                      size: 30, color: doneORnot ? Colors.green : Colors.red),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        delete(index);
                      },
                      icon: Icon(Icons.delete),
                      iconSize: 30,
                      color: const Color.fromARGB(255, 218, 151, 146))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
