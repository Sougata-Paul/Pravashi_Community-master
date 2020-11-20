import 'package:flutter/material.dart';
class MemberSubscription extends StatefulWidget {
  @override
  _MemberSubscriptionState createState() => _MemberSubscriptionState();
}

class _MemberSubscriptionState extends State<MemberSubscription> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Member Subscription'),
        ),
      ),
    );
  }
}
