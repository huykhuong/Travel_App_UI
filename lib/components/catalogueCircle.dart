import 'package:flutter/material.dart';

class CatalougeCircle extends StatelessWidget {
  final IconData icon;
  final Function selectCircle;
  final Color color;

  CatalougeCircle(this.icon, this.selectCircle, this.color);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectCircle,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}