import 'package:flutter/material.dart';

class StartTimeWidget extends StatelessWidget {

  final String startTime;

  StartTimeWidget(this.startTime);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: Alignment.center,
      child: Text(
          '$startTime'),
    );
  }
}