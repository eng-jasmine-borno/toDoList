
import 'package:button/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier{
  Color color =Colors.blue;
  Color colorChoose =Colors.blue;
  final List<Task> todoList = <Task>[];
  final List<Widget> todoWidgets = <Widget>[];
  // List<Color>? pickColor=[Colors.redAccent,Colors.blue,Colors.green];
  final TextEditingController textFieldController = TextEditingController();
  final TextEditingController subTiltleController = TextEditingController();

  int get notesCount {
    return todoList.length;
  }

  void deleteTask(BuildContext context,Task task) {
    todoList.remove(task);
    print(todoList.length);
    // todoWidgets.remove(buildTodoItem(context,task.name));
    notifyListeners();
  }

  void deleteTitle(BuildContext context,Task task) {
      todoList.remove(task);
      Navigator.pop(context);
    notifyListeners();
  }
  void addTodoItem(String title,String subtitle,Color pickcolor2) {
    todoList.add(Task(name:title,description:subtitle,color: pickcolor2));
    textFieldController.clear();
    subTiltleController.clear();
    // color =Colors.white70;
    notifyListeners();
  }
// to show notes
  List<Widget> getNotes(BuildContext context) {
    for (Task title in todoList) {
      todoWidgets.add(buildTodoItem(context,title.name,title.description,color: title.color));
    }
    notifyListeners();
    return todoWidgets;
  }


}
class Task {
  final String name,description;
  Color color;
  Task({required this.name,required this.description,required this.color});

}
// class SharedPref{
//  static  saveColor(int color) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setInt('color', color);
//   }
//  static getColor() async {
//     final prefs = await SharedPreferences.getInstance();
//     final r = prefs.getInt('color');
//     return Color(r!);
//   }
// }