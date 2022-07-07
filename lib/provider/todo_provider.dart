import 'package:flutter/material.dart';

import '../model/todo.dart';

class Todoprovider extends ChangeNotifier{

  List<Todo> todos=[];

  addnewtodo(title,description){
    var newtodos= Todo(title, description);
    todos.add(newtodos);
    notifyListeners();
  }
  deletetodo(index){
    todos.removeAt(index);
    notifyListeners();
  }

}
