import 'package:flutter/material.dart';
import 'package:pravashi_community/More/member_subscription.dart';
import 'package:pravashi_community/More/donation.dart';
import 'package:pravashi_community/More/newevents.dart';
import 'package:pravashi_community/More/gallery.dart';
import 'package:pravashi_community/More/resources.dart';
import 'package:pravashi_community/More/log.dart';

import 'package:flutter/material.dart';
class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Image pic;
  String log='Log In';
  @override
  Widget build(BuildContext context) {
    return  Drawer(
          child: Container(
            color: Colors.cyan,
            child:Column(
              children:<Widget>[
                Visibility( visible:false,child:FlatButton(onPressed: (){}, child:Row(children: [
                  Text('5fg6h7')
                ],)),),
                FlatButton(onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>MemberSubscription()));
                }, child: Text('Member Subscription')),
                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Donation()));
                }, child: Text('Donation')),
                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>NewEvents()));
                }, child: Text('Upcoming Events')),
                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Gallery()));
                }, child: Text('Gallery')),

                FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Resources()));
                }, child: Text('Resources')),
                FlatButton(onPressed: (){
                  login(context);
                }, child: Text(log))
              ]
            )
          )
        );

  }
  void login(BuildContext context){
    var alertDialog=AlertDialog(
      title: Text('log in page'),
      content:Log() ,
    );
    showDialog(context: context,
        builder: (BuildContext context){
          return alertDialog;
        }
    );
  }
}
