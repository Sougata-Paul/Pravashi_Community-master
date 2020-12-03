import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pravashi_community/More/profile.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final formkey = new GlobalKey<FormState>();
  bool showspinner = false;
  bool vis = false, vis2 = false, vis3 = false, vis4 = true;
  String email = '', password, password2, firstname, lastname;

  bool emailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  // bool checkAllField(String fn, String ln, String em, String pass, String pass2){
  //   if (fn!=null && ln!=null && em!=null && pass!=null && pass2!=null)
  //     return false;
  //   else
  //     return true;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        children:<Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            // appBar: AppBar(
            //   backgroundColor: Colors.lightBlueAccent.shade700,
            //   title: Center(
            //     child: Text('Registration Page'),
            //   ),
            // ),
            body: ModalProgressHUD(
              inAsyncCall: showspinner,
              child: new ListView(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: formkey,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (firstname) {
                              if (firstname == null || firstname.isEmpty) {
                                return 'please enter first name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              //input text here
                              firstname = value;
                              // vis4 = checkAllField(firstname, lastname, email, password, password2);
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.orangeAccent[100],
                                ),
                                labelText: 'First Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (lastname) {
                              if (lastname == null || lastname.isEmpty) {
                                return 'please enter last name';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              lastname = value;
                              // vis4 = checkAllField(firstname, lastname, email, password, password2);
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.orangeAccent[100],
                                ),
                                labelText: 'Last Name'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'please enter email name';
                              }
                              return null;
                            },
                            onChanged: (value) async {
                              final users = await _firestore
                                  .collection('users')
                                  .where('email', isEqualTo: value)
                                  .get();
                              if (emailValid(value)) {
                                setState(() {
                                  vis2 = false;
                                  if (users.docs.length == 0) {
                                    vis3 = false;
                                    email = value;
                                    // vis4 = checkAllField(firstname, lastname, email, password, password2);
                                  } else {
                                    vis3 = true;
                                  }
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
                                  color: Colors.orangeAccent[100],
                                ),
                                labelText: 'Email'),
                          ),
                        ),
                        Visibility(
                          visible: vis2,
                          child: Text(
                            'Please Enter A Valid Email Address',
                            style: TextStyle(
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: vis3,
                          child: Text(
                            'Email address already exists',
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
                            validator: (password) {
                              if (password == null || password.isEmpty) {
                                return 'please enter password';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              password = value;
                              // vis4 = checkAllField(firstname, lastname, email, password, password2);
                              if (password != password2) {
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
                                  Icons.perm_device_info,
                                  color: Colors.orangeAccent[100],
                                ),
                                labelText: 'Password'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            validator: (password2) {
                              if (password2 == null || password2.isEmpty) {
                                return 'please enter confirm password';
                              }
                              return null;
                            },
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
                              password2 = value;
                              // vis4 = checkAllField(firstname, lastname, email, password, password2);
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.perm_device_info,
                                  color: Colors.orangeAccent[100],
                                ),
                                labelText: 'Confirm Password'),
                          ),
                        ),
                        Visibility(
                          visible: vis,
                          child: Text(
                            'Password and Confirm Password should be same',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // Visibility(
                        //   visible: vis4,
                        //   child: Text(
                        //     'All fields are mandatory',
                        //     style: TextStyle(color: Colors.redAccent),
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 100,),
                            Container(
                              height: 1.4 *
                                  (MediaQuery.of(context).size.height / 20),
                              width:
                                  5 * (MediaQuery.of(context).size.width / 10),
                              margin: EdgeInsets.only(bottom: 20),
                              child: RaisedButton(
                                elevation: 5.0,
                                color: Colors.orangeAccent[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                onPressed: () async {
                                  // setState(() {
                                  //   showspinner=true;
                                  // });
                                  if (formkey.currentState.validate()) {
                                    setState(() {
                                      showspinner = true;
                                    });
                                    try {
                                      final newuser = await _auth
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password);
                                      if (newuser != null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    profile()));
                                        _firestore
                                            .collection('users')
                                            .doc(newuser.user.uid)
                                            .set({
                                          'firstname': firstname,
                                          'lastname': lastname,
                                          'email': email,
                                          'position': 2,
                                        });
                                      } else {
                                        return null;
                                      }
                                      // setState(() {
                                      //   showSpinner=true;
                                      // });
                                      setState(() {
                                        showspinner = false;
                                      });
                                    } catch (e) {
                                      var alert = AlertDialog(
                                        content: Text('User Already Exists'),
                                      );
                                      setState(() {
                                        showspinner = false;
                                      });
                                      return showDialog(
                                        context: context,
                                        builder: (context) => alert,
                                      );
                                    }
                                    //before onpr
                                  }
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 40,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
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
//
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//
//   bool vis = false, vis2 = false, vis3 = false, vis4=true;
//   String email='', password, password2, firstname, lastname;
//
//   bool emailValid(String email){
//     return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
//   }
//
//   bool checkAllField(String fn, String ln, String em, String pass, String pass2){
//     if (fn!=null && ln!=null && em!=null && pass!=null && pass2!=null)
//       return false;
//     else
//       return true;
//   }
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
//                       vis4 = checkAllField(firstname, lastname, email, password, password2);
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
//                       vis4 = checkAllField(firstname, lastname, email, password, password2);
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
//                     onChanged: (value) async {
//                       final users = await _firestore.collection('users').where('email', isEqualTo: value).get();
//                       if (emailValid(value)) {
//                         setState(() {
//                           vis2 = false;
//                           if (users.docs.length == 0) {
//                             vis3 = false;
//                             email = value;
//                             vis4 = checkAllField(firstname, lastname, email, password, password2);
//                           }
//                           else {
//                             vis3 = true;
//                           }
//                         });
//                       } else {
//                         setState(() {
//                           vis2 = true;
//                         });
//                       }
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
//                     'Please Enter A Valid Email Address',
//                     style: TextStyle(
//                       color: Colors.redAccent,
//                     ),
//                   ),
//                 ),
//                 Visibility(
//                   visible: vis3,
//                   child: Text(
//                     'Email address already exists',
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
//                       vis4 = checkAllField(firstname, lastname, email, password, password2);
//                       if (password != password2) {
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
//                         labelText: 'Password'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     obscureText: true,
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
//                       password2=value;
//                       vis4 = checkAllField(firstname, lastname, email, password, password2);
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
//                     'Password and Confirm Password should be same',
//                     style: TextStyle(color: Colors.redAccent),
//                   ),
//                 ),
//                 Visibility(
//                   visible: vis4,
//                   child: Text(
//                     'All fields are mandatory',
//                     style: TextStyle(color: Colors.redAccent),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Container(
//                       height: 1.4 * (MediaQuery
//                           .of(context)
//                           .size
//                           .height / 20),
//                       width: 5 * (MediaQuery
//                           .of(context)
//                           .size
//                           .width / 10),
//                       margin: EdgeInsets.only(bottom: 20),
//                       child: RaisedButton(
//                         elevation: 5.0,
//                         color: Colors.lightBlueAccent,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         onPressed: () async {
//                           try {
//                             if (firstname!=null && lastname!=null && email!=null && password!=null && password==password2 &&
//                                 vis==false && vis2==false && vis3==false && vis4==false) {
//                               final newuser = await _auth.createUserWithEmailAndPassword(
//                                   email: email,
//                                   password: password
//                               );
//                               if (newuser != null) {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
//                                 _firestore.collection('users').doc(
//                                     newuser.user.uid).set({
//                                   'firstname': firstname,
//                                   'lastname': lastname,
//                                   'email': email,
//                                   'position': 2,
//                                 });
//                               }
//                             }
//                             else {
//                               return null;
//                             }
//                           }
//                           catch (e) {
//                             var alert = AlertDialog(
//                               content: Text('User Already Exists'),
//                             );
//                             return showDialog(
//                               context: context, builder: (context) => alert,);
//                           }
//                           //before onpr
//                         },
//
//                         child: Text("Sign Up",
//                           style: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 1.5,
//                             fontSize: MediaQuery
//                                 .of(context)
//                                 .size
//                                 .height / 40,
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
