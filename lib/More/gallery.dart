import 'package:flutter/material.dart';
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Gallery'),
          ),
        ),
      );
  }
}
