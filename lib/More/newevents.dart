import 'package:flutter/material.dart';
class NewEvents extends StatefulWidget {
  @override
  _NewEventsState createState() => _NewEventsState();
}

class _NewEventsState extends State<NewEvents> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Upcoming Events'),
        ),
      ),
    );
  }
}
