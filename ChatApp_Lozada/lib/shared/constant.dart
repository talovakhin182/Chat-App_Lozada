import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.5)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0)
  ),
);

Row orDivider(){
  return Row (
    children: <Widget>[
      Expanded(
        child: Divider(
          height: 25.0,
          color: Colors.white,
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Text(
          'or',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      Expanded(
        child: Divider(
          height: 25.0,
          color: Colors.white,
        )
      ),
    ]
  );
}