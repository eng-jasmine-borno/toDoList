import 'package:button/editNote.dart';
import 'package:button/main.dart';
import 'package:button/taskData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'newnote.dart';

class Home extends StatefulWidget {
 Home({Key? key, this.loading}) : super(key: key);
  final bool? loading;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Provider.of<TaskData>(context,listen: false).color,
        title: Text('MY Notes', textAlign: TextAlign.center),
      ),
      body: Center(
         child: ListView(
           children: <Widget>[
             Provider.of<TaskData>(context,listen: false).todoList.isNotEmpty?
          Consumer<TaskData>(
               builder: (BuildContext context, taskData, Widget? child) {
           return  ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                 itemCount:  Provider.of<TaskData>(context,listen: false).notesCount,
                 itemBuilder: (context,index){
                   final task = taskData.todoList[index];
                   return buildTodoItem(context,
                     Provider.of<TaskData>(context,listen: false).todoList[index].name,
                     Provider.of<TaskData>(context,listen: false).todoList[index].description,
                  // press: (){
                  //  Provider.of<TaskData>(context,listen: false).deleteTask(context,task);},
                     color: Provider.of<TaskData>(context,listen: false).todoList[index].color);}

                 );}):
             Column(children: [
                   Padding(padding: EdgeInsets.only(top: 140.0, bottom: 70.0),
                       child: Image.asset('assets/images/paper.png',
                         height: 200, width: 200,)
                   ),
                   Container(
                     child: const Text('No Notes :(', textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.blue,
                       ),
                     ),
                   ),
                   Container(
                     padding: EdgeInsets.only( top:15.0),
                     child:
                     Text('You have no task to do',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                         fontSize: 16,
                         color: Colors.black45,
                       ),
                     ),
                   ),
                 ],),])),
        floatingActionButton: FloatingActionButton(
        child :Image.asset("assets/images/plus.png" ),
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context) => Note()),);
                 },
               ),
    );
  }
}
