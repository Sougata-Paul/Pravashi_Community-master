import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pravashi_community/Pages/home.dart';
import 'package:pravashi_community/Pages/events.dart';
import 'package:pravashi_community/Pages/notifications.dart';
import 'package:pravashi_community/Pages/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int press =0;
  int index=0;
  int old=0;
  bool vis=false;
  List<Widget> Pages= [Home(),News(),Events(),Menu()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(child:Text('Probasee Community App')),
        ),
        body:Stack(
          children:<Widget>[Center(
            child: Pages[old],
        ),
            Visibility(
              visible: vis,
                child: Positioned(
                bottom: 0,
                right: 0,
                height:350,
                width: 200,
                child:Menu()
            )
            )
  ]
        ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.pink,
            fixedColor: Colors.cyanAccent,
            currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
            BottomNavigationBarItem(icon:Icon(Icons.notifications_active_outlined),label:'Notifications'),
            BottomNavigationBarItem(icon:Icon(Icons.event),label: 'calender'),
            BottomNavigationBarItem(icon:Icon(Icons.menu),label: 'More'),

        ],
            onTap:(value) {
              if (value == 3) {
                setState(() {
                  index = value;
                  vis = !vis;
                });
                if(vis==false){
                  index=old;
                }
              }
              else{
              setState(() {
                vis=false;
              index=value;
              old=value;
              });
              }
            }
      ),
      )
    );
  }
}
