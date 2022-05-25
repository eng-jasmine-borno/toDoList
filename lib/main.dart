import 'package:button/editNote.dart';
import 'package:button/taskData.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:provider/provider.dart';

Widget buildTodoItem(BuildContext context,String title,String description, {Color? color}) {
  return GestureDetector(
      child: Stack(
        children: [
       Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(width: 140,height:70,color: color,),
        ),
       Card(margin:const EdgeInsets.only(top:15.0,bottom:0,left:20,right:20),
        child: ListTile(
          title: Text(title,style: TextStyle(fontSize: 16,color: Color(0xff1321E0)) ),subtitle: Text(description),)),
      ]),
      onTap: (){
      // go to edit page
      Navigator.push(context, MaterialPageRoute(builder:(context) => EditNote(title: title,)),);

    },
  );

}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider(
        create: (context) => TaskData(),
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/ypnotes.png',
              height: 600,
              width: 250,
            ),
            ),

            Container(
                padding: EdgeInsets.only(left: 50, right:50, bottom:20),
                height: 80,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) =>  Home()),);
                    },
                  child: Text("Get started"),
                )
            ),
          ],
        ));
  }
}


