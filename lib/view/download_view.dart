import 'package:flutter/material.dart';

class DownloadView extends StatefulWidget {
  @override
  _DownloadViewState createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Downloads', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
