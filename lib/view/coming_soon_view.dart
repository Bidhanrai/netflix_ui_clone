import 'package:flutter/material.dart';

class ComingSoonView extends StatefulWidget {
  @override
  _ComingSoonViewState createState() => _ComingSoonViewState();
}

class _ComingSoonViewState extends State<ComingSoonView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Coming Soon', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
