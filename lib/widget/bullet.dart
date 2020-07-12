import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  final Color color;
  final Size size;
  Bullet({this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),

      height: size.height,
      width: size.width,
    );
  }
}
