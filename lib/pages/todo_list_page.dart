import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/components/list_item.dart';

class TodolistPage extends StatefulWidget {
  TodolistPage({super.key});

  @override
  State<TodolistPage> createState() => _TodolistPageState();
}

class _TodolistPageState extends State<TodolistPage> {
  final TextEditingController todoController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Estudar Flutter!'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00d7f3),
                      padding: const EdgeInsets.all(18),
                    ),
                    onPressed: () {
                      String text = todoController.text;
                      setState(() {
                        todos.add(text);
                      });
                      todoController.clear();
                    },
                    child: const Icon(Icons.add, size: 30),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Flexible(
                child: ListView(shrinkWrap: true, children: [
                  for (String todo in todos)
                    ListItem(title: todo,)
                ]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Expanded(child: Text('teste')),
                  const SizedBox(width: 8),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00d7f3),
                        padding: const EdgeInsets.all(18),
                      ),
                      onPressed: () {
                        todoController.clear();
                        setState(() {
                          todos.clear();
                        });
                      },
                      child: const Text('Limpar tudo'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
