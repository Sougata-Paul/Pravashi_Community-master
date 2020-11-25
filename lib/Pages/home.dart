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
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,),
        ),
        Text(
          'Latest News and announcement',
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        ),
        Text(
          'For details on Covid-19 connect here',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.redAccent,
          ),
        ),
        Text(
          'Covid 19 At New Zealand Alert 1',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.redAccent,
          ),
        ),
        Text(
          'For Latest figures on COVID-19, Please connect HERE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.redAccent,
          ),
        ),
        Text(
          ' -We rely on the generosity of our sponsors and members to fund our various activities during the year. All donations big or small are gratefully accepted.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.redAccent,
          ),
        ),
        Text(
          '- To donate, please deposit your donation into ASB account 12-3064-0202393-00',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.redAccent,
          ),
        ),
        Text(
          '- For Sponsorship and Advertisement related enquiries, please contact us HERE',
          textAlign: TextAlign.center,

          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Colors.redAccent,
          ),
        ),
      ],
    );
  }
}
