import 'package:flutter/material.dart';

const dropDownContainer = ShapeDecoration(
  shape: RoundedRectangleBorder(
    side: BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);
const textInputDecoration = InputDecoration(

  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 2.0,
    ),
  ),
);
