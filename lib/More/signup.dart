// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:pravashi_community/More/profile.dart';
//
// class signup extends StatefulWidget {
//   @override
//   _signupState createState() => _signupState();
// }
//
// class _signupState extends State<signup> {
//   final _auth = FirebaseAuth.instance;
//   bool vis = false;
//   bool vis2 = false;
//   final _firestore = FirebaseFirestore.instance;
//   String email;
//   String password;
//   String firstname;
//   String lastname;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.lightBlueAccent.shade700,
//           title: Center(
//             child: Text('Registration Page'),
//           ),
//         ),
//         body: new ListView(
//           children: <Widget>[
//             new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     onChanged: (value) {
//                       //input text here
//                       firstname = value;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.account_circle,
//                           color: Colors.lightBlueAccent,
//                         ),
//                         labelText: 'First Name'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     onChanged: (value) {
//                       lastname = value;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.account_circle,
//                           color: Colors.lightBlueAccent,
//                         ),
//                         labelText: 'Last Name'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (value) {
//                       //input text here
//                       email = value;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.lightBlueAccent,
//                         ),
//                         labelText: 'Email'),
//                   ),
//                 ),
//                 Visibility(
//                   visible: vis2,
//                   child: Text(
//                     'please enter a valid email address',
//                     style: TextStyle(
//                       color: Colors.redAccent,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     obscureText: true,
//                     keyboardType: TextInputType.text,
//                     onChanged: (value) {
//                       password = value;
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.lightBlueAccent,
//                         ),
//                         labelText: 'Password'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     onChanged: (value) {
//                       if (password != value) {
//                         setState(() {
//                           vis = true;
//                         });
//                       } else {
//                         setState(() {
//                           vis = false;
//                         });
//                       }
//                     },
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.lightBlueAccent,
//                         ),
//                         labelText: 'Confirm Password'),
//                   ),
//                 ),
//                 Visibility(
//                   visible: vis,
//                   child: Text(
//                     'password and confirm password should be same',
//                     style: TextStyle(color: Colors.redAccent),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: 1.4 * (MediaQuery.of(context).size.height / 20),
//                       width: 5 * (MediaQuery.of(context).size.width / 10),
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: RaisedButton(
//                         elevation: 5.0,
//                         color: Colors.lightBlueAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         onPressed: () async {
//                           try {
//                             final newuser =
//                                 await _auth.createUserWithEmailAndPassword(
//                                     email: email, password: password);
//                             if (newuser != null) {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => profile()));
//                               _firestore
//                                   .collection('users')
//                                   .doc(newuser.user.uid)
//                                   .set({
//                                 'firstname': firstname,
//                                 'lastname': lastname,
//                                 'email': email,
//                                 'position': 2,
//                               });
//                             }
//                           } catch (e) {
//                             var alert = AlertDialog(
//                               content: Text('User Already Exists'),
//                             );
//                             return showDialog(
//                               context: context,
//                               builder: (context) => alert,
//                             );
//                           }
//                           //before onpr
//                         },
//                         child: Text(
//                           "signup",
//                           style: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 1.5,
//                             fontSize: MediaQuery.of(context).size.height / 40,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pravashi_community/More/profile.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _auth = FirebaseAuth.instance;
  bool vis = false;
  bool vis2 = false;
  final _firestore = FirebaseFirestore.instance;
  String email='';
  String password;
  String firstname;
  String lastname;
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
            child: Text('Registration Page'),
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
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      //input text here
                      firstname = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.lightBlueAccent,
                        ),
                        labelText: 'First Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      lastname = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Colors.lightBlueAccent,
                        ),
                        labelText: 'Last Name'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
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
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        ),
                        labelText: 'Email'),
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
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        ),
                        labelText: 'Password'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      if (password != value) {
                        setState(() {
                          vis = true;
                        });
                      } else {
                        setState(() {
                          vis = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        ),
                        labelText: 'Confirm Password'),
                  ),
                ),
                Visibility(
                  visible: vis,
                  child: Text(
                    'password and confirm password should be same',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 1.4 * (MediaQuery
                          .of(context)
                          .size
                          .height / 20),
                      width: 5 * (MediaQuery
                          .of(context)
                          .size
                          .width / 10),
                      margin: EdgeInsets.only(bottom: 20),
                      child: RaisedButton(
                        elevation: 5.0,
                        color: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () async {
                          try {
                            final newuser = await _auth
                                .createUserWithEmailAndPassword(
                                email: email, password: password);
                            if (newuser != null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                              _firestore.collection('users').doc(
                                  newuser.user.uid).set({
                                'firstname': firstname,
                                'lastname': lastname,
                                'email': email,
                                'position': 2,
                              });
                            }
                          }
                          catch (e) {
                            var alert = AlertDialog(
                              content: Text('User Already Exists'),
                            );
                            return showDialog(
                              context: context, builder: (context) => alert,);
                          }
                          //before onpr
                        },

                        child: Text("signup",
                          style: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .height / 40,
                          ),
                        ),
                      ),
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