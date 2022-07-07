import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provide/details_screen.dart';
import 'package:provide/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  get random => null;

  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<Todoprovider>(context);
    TextEditingController _titlecontroler = TextEditingController();
    TextEditingController _descriptioncontroler = TextEditingController();




    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                  title: Text('Add a new Todo'),
                  content: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: "Title"),
                        controller: _titlecontroler,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: "Title"),
                        controller: _descriptioncontroler,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final title = _titlecontroler.text;
                          final description = _descriptioncontroler.text;
                          todos.addnewtodo(title, description);
                          Navigator.pop(context);
                        },
                        child: Text('Add'),
                      ),
                    ],
                  )),
            );
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: todos.todos.length,
          itemBuilder: (_, index) {
            return Card(
              elevation: 7,
              color: Colors.lightGreen,

              child: FlatButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text(todos.todos[index].title),
                            content: Row(
                              children: [
                                Text(todos.todos[index].description),
                              ],
                            ),
                          ));
                },
                child: ListTile(
                  title: Text(todos.todos[index].title),
                  subtitle: Text(todos.todos[index].description),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                            title: Text("Are you sure you want to delete?"),
                            content: Row(
                              children: [
                                FlatButton(
                                    onPressed: () {
                                      todos.deletetodo(index);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Yes')),
                                SizedBox(
                                  width: 20,
                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No')),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
