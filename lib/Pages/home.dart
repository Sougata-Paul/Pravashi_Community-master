import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image(
          image: AssetImage('images/probasee.jpg'),
          fit: BoxFit.fill,
        ),
        Text(
          'Welcome To Probasee Bengalee Association Of New Zealand',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'Latest News and announcement',
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
