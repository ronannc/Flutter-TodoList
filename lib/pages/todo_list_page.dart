import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/components/list_item.dart';
import 'package:to_do_list/models/item.dart';

class TodolistPage extends StatefulWidget {
  const TodolistPage({super.key});

  @override
  State<TodolistPage> createState() => _TodolistPageState();
}

class _TodolistPageState extends State<TodolistPage> {
  final TextEditingController todoController = TextEditingController();

  List<Item> todos = [];
  Item? deletedItem;
  int? deletedItemIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                          todos
                              .add(Item(title: text, dateTime: DateTime.now()));
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
                    for (Item todo in todos)
                      ListItem(item: todo, onDelete: onDelete)
                  ]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: Text('Voce possui ${todos.length} tarefas')),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00d7f3),
                          padding: const EdgeInsets.all(18),
                        ),
                        onPressed: showDeleteItensConfirmationDialo,
                        child: const Text('Limpar tudo'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Item item) {
    deletedItem = item;
    deletedItemIndex = todos.indexOf(item);
    setState(() {
      todos.remove(item);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Tarefa ${item.title} foi removido com sucesso!',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.grey.shade200,
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          setState(() {
            todos.insert(deletedItemIndex!, deletedItem!);
          });
        },
      ),
    ));
  }

  void showDeleteItensConfirmationDialo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar tudo?'),
        content:
            const Text('Voce tem certeza que deseja apagar todas as tarefas?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar',
                style: TextStyle(color: Color(0xff00d7f3))),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                todoController.clear();
                setState(() {
                  todos.clear();
                });
              },
              child: const Text(
                'Limpar Tudo',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
