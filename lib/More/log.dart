import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pravashi_community/More/profile.dart';

class Log extends StatefulWidget {
  @override
  _LogState createState() => _LogState();
}

class _LogState extends State<Log> {
  final _auth = FirebaseAuth.instance;
  String email, password;
  bool vis2=false;
  bool emailValid(String email){
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent.shade700,
          title: Center(
            child: Text('Log in'),
          ),
        ),
        body: new ListView(
          children: <Widget>[
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onChanged: (value){
                      if (emailValid(value)) {
                        setState(() {
                          vis2 = false;
                          email = value;
                        });
                      } else {
                        setState(() {
                          vis2 = true;
                        });
                      }

                    }, //onChanged
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        ),
                        labelText: 'E-mail'),
                  ),
                ),
                Visibility(
                  visible: vis2,
                  child: Text(
                    'please enter a valid email address',
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value){
                      password = value;
                    }, //onChanged
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.lightBlueAccent,
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text("Forgot Password"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 1.4 * (MediaQuery.of(context).size.height / 20),
                      width: 5 * (MediaQuery.of(context).size.width / 10),
                      margin: EdgeInsets.only(bottom: 20),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () async {
                          try {
                            final newuser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                            if (newuser!=null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                            }
                          }
                          catch (e) {
                            var alert = AlertDialog(
                              content: Text('Login Failed.'),
                            );
                            return showDialog(
                              context: context, builder: (context) => alert,);
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: MediaQuery.of(context).size.height / 40,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 1.4 * (MediaQuery.of(context).size.height / 20),
                      width: 5 * (MediaQuery.of(context).size.width / 10),
                      margin: EdgeInsets.only(bottom: 20),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}