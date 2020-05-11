import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const dropDownContainer = ShapeDecoration(
  shape: RoundedRectangleBorder(
    side: BorderSide(width: 2.0, style: BorderStyle.solid, color: Colors.grey),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
);

// font styles
const textStyleItalicThin = TextStyle(
  fontWeight: FontWeight.w100,
  fontStyle: FontStyle.italic,
  height: 1.90,
  fontSize: 13.0,
);
const numberStyleMedium = TextStyle(
  fontWeight: FontWeight.w600,
  fontFamily: 'iceLand',
  letterSpacing: 1.0,
  fontSize: 19.0,
);

const textStyleMedium = TextStyle(
  fontWeight: FontWeight.w700,
  letterSpacing: 2.0,
  fontSize: 19.0,
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
