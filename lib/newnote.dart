import 'package:button/editNote.dart';
import 'package:button/homescreen.dart';
import 'package:button/main.dart';
import 'package:button/taskData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myColorPicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/material/colors.dart';



class Note extends StatefulWidget {
   Note ({Key? key, this.loading}) : super(key: key);
  final bool? loading;

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {

   String formattedTime = DateFormat('kk:mm:a').format(DateTime.now());
   String formattedDay = DateFormat('dd MMMM').format(DateTime.now());
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<TaskData>(context,listen: false).color,
        title: Text('New Note'),
        actions: [
          Container(
            margin: EdgeInsets.only(right:10.0),
            child: IconButton(
              onPressed: () {
              setState(() {
               _show(context);});
              },
                icon: Icon(Icons.more_vert,)),

          ),

          Container(
            margin: EdgeInsets.only(right:20.0),
            child: IconButton(icon:Icon(Icons.check),
              onPressed: ()async{
            // await  SharedPref.saveColor(Provider.of<TaskData>(context,listen: false).color.value);
            // Provider.of<TaskData>(context,listen: false).colorChoose = await SharedPref.getColor();
             Provider.of<TaskData>(context, listen: false).addTodoItem(
               Provider.of<TaskData>(context,listen: false).textFieldController.text,
               Provider.of<TaskData>(context,listen: false).subTiltleController.text,
                 Provider.of<TaskData>(context,listen: false).color
             );
               Navigator.push(context, MaterialPageRoute(builder: (_) => Home())).then((_) {
                 // This block runs when you have come back to the 1st Page from 2nd.
                 setState(() {
                   // Call setState to refresh the page.
                 });
               });
               //   Navigator.of(context).pop();

          }),
          ),
        ],
      ),
      body:
     Center(
      child: ListView(
          children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child:
                  Container(
                  padding: EdgeInsets.only(top: 20.0, left:20.0),
                    child: Row(children: [
                      Text('${formattedTime}, ',style: TextStyle(color: Colors.grey),),
                      Text(formattedDay,style: TextStyle(color: Colors.grey))
                    ],)

                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                  padding: EdgeInsets.only(left:20.0, right:20.0),
                  height: 30,
                  child:
                  TextFormField(
                    controller: Provider.of<TaskData>(context,listen: false).textFieldController,
                      // onChanged: (newText) {
                      //   Provider.of<TaskData>(context,listen: false).textFieldController.text = newText;
                      // },
                    decoration: const InputDecoration(hintText:'Type Something...',
                      hintStyle:  TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    ),)
              ),
              ),
                ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(width: 60,
                padding: EdgeInsets.only(left:20.0, top:20.0,right: 10),
                child: TextFormField(
                  controller: Provider.of<TaskData>(context,listen: false).subTiltleController,
                  // onChanged: (newText) {
                  //   Provider.of<TaskData>(context,listen: false).subTiltleController.text = newText;
                  // },
                  decoration: InputDecoration(hintText:'Type Something...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 0.001, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintStyle:  TextStyle(
                      fontSize: 20,
                      color: Colors.blue.withOpacity(0.2),
                    ),
                 ),
              ),
            )),



  ]
    ),
    )
    );
  }

  void _show(BuildContext ctx) {
      showModalBottomSheet(backgroundColor: Provider.of<TaskData>(context,listen: false).color,
          elevation: 10,
          context: ctx,
          builder: (ctx){
            return StatefulBuilder(builder: (BuildContext context,StateSetter setState){
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
                          CircleAvatar(radius: 20,backgroundColor: Colors.white70,
                              child: Icon(Icons.share,color: Colors.black,)),
                          SizedBox(width: 20,),
                          Text('Share with your Friends',style: TextStyle(fontSize: 17,)),
                        ],) ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: GestureDetector(child: Row(children: [
                          CircleAvatar(radius: 20,backgroundColor: Colors.white70,
                              child: Icon(Icons.delete,color: Colors.black,)),
                          SizedBox(width: 20,),
                          Text('Delete',style: TextStyle(fontSize: 17,),),

                        ],) , onTap: () {
                          // Provider.of<TaskData>(context,listen: false).todoList.removeLast();
                          // setState(() {
                          // });
                        },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: GestureDetector(child:
                        Row(children: [
                          CircleAvatar(radius: 20,backgroundColor: Colors.white70,
                              child: Icon(Icons.content_paste_outlined,color: Colors.black,)),
                          SizedBox(width: 20,),
                          Text('Duplicate',style: TextStyle(fontSize: 17,),)
                        ],) ,
                        ),
                      ),
                      MyColorPicker(
                          onSelectColor: (value) {
                            setState(() {
                              Provider.of<TaskData>(context,listen: false).color = value;
                            });
                            setState(() {
                            });
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
                  ),));});});
    }

}