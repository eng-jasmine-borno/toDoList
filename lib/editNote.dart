
import 'package:button/homescreen.dart';
import 'package:button/main.dart';
import 'package:button/taskData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myColorPicker.dart';
class EditNote extends StatefulWidget {
  EditNote({Key? key, required this.title}) : super(key: key);
  String title="";
  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Note"),backgroundColor: Provider.of<TaskData>(context,listen: false).color,
        actions: [
          Container(
            margin: EdgeInsets.only(right:10.0),
            child:
            IconButton( onPressed: () {
              setState(() {
                _show(context);});
            },
                icon: Icon(Icons.more_vert,)),

          ),

          Container(
            margin: EdgeInsets.only(right:20.0),
            child: IconButton(icon:Icon(Icons.check),
                onPressed: (){
                  // setState(() {
                  //   Provider.of<TaskData>(context,listen: false).addTodoItem(Provider.of<TaskData>(context,listen: false).textFieldController.text);
                  // });
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Home())).then((_) {
                    // This block runs when you have come back to the 1st Page from 2nd.
                    setState(() {
                      // Call setState to refresh the page.
                    });
                  });
                  // Navigator.of(context).pop();

                }),
          ),
        ],),
      body:  (Provider.of<TaskData>(context, listen: false).todoList.isNotEmpty) ?

      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:30,top:25),
            child: Text('Meeting with client',style: TextStyle(fontSize: 18,color: Color(0xff1321E0)),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child:Text(widget.title,style: TextStyle(fontSize: 16),)
            ),
          ),
        ],
      ):Container()
    );
  }
  void _show(BuildContext ctx) {
    showModalBottomSheet(backgroundColor: Provider.of<TaskData>(context,listen: false).color,
        elevation: 10,
        context: ctx,
        builder: (ctx) {
          return Consumer<TaskData>(
              builder: (BuildContext context, taskData, Widget? child) {
                final task = taskData.todoList[0];
                return
                  StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Container(
                            width: 300,
                            height: 350,
                            color: Provider.of<TaskData>(context,listen: false).color,
                            child: Align(alignment: Alignment.center,
                              child: Column(

                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: GestureDetector(child:
                                    Row(children: [
                                      CircleAvatar(radius: 20,
                                          backgroundColor: Colors.white70,
                                          child: Icon(
                                            Icons.share, color: Colors.black,)),
                                      SizedBox(width: 20,),
                                      Text('Share with your Friends',
                                          style: TextStyle(fontSize: 17,)),
                                    ],),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: GestureDetector(
                                          child: Row(children: const [
                                            CircleAvatar(radius: 20,
                                                backgroundColor: Colors.white70,
                                                child: Icon(Icons.delete,
                                                  color: Colors.black,)),
                                            SizedBox(width: 20,),
                                            Text('Delete',
                                              style: TextStyle(fontSize: 17,),),
                                          ],),

                                          onTap: () {
                                          (Provider.of<TaskData>(context, listen: false).todoList.isNotEmpty) ?
                                              Provider.of<TaskData>(context, listen: false).deleteTitle(context,task):const SizedBox();
                                          Navigator.pop(context);
                                          })),

                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: GestureDetector(child:
                                    Row(children: [
                                      CircleAvatar(radius: 20,
                                          backgroundColor: Colors.white70,
                                          child: Icon(
                                            Icons.content_paste_outlined,
                                            color: Colors.black,)),
                                      SizedBox(width: 20,),
                                      Text('Duplicate',
                                        style: TextStyle(fontSize: 17,),)
                                    ],),
                                    ),
                                  ),
                                  MyColorPicker(
                                      onSelectColor: (value) {
                                        setState(() {
                                          Provider.of<TaskData>(context,listen: false).color = value;
                                        });
                                        setState(() {});
                                      },
                                      availableColors: const [
                                        Colors.white,
                                        Colors.yellow,
                                        Color(0xffF28B81),
                                        Color(0xffFBF476),
                                        Color(0xffCDFF90),
                                        Color(0xffCBF0F8),
                                        Color(0xffA7FEEB),
                                        Color(0xffAFCBFA),
                                        Color(0xffD7AEFC),
                                        Color(0xffFBCFE9),
                                        Color(0xffE6C9A9),
                                        Color(0xffE9EAEE),
                                      ],
                                      initialColor: Colors.blue)
                                ],
                              ),));
                      });
              });
        });
  }
}

