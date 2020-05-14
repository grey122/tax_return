import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/services/auth.dart';

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
//moneyTaxes
const numberStyleMedium = TextStyle(
  fontWeight: FontWeight.w800,
  fontFamily: 'iceLand',
  letterSpacing: 1.0,
  fontSize: 35.0,
);

var containerBorderNumber = ShapeDecoration(
  color: Colors.grey[850],
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 2.0,
      style: BorderStyle.solid,
      color: Colors.black,
    ),
    borderRadius:
    BorderRadius.all(Radius.circular(15.0)),
  ),
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

//app bar constant
 AppBar defaultAppBar = AppBar(

  title: Text('Home Tax Return'),
  elevation: 0.0,
  actions: <Widget>[
    FlatButton.icon(
      onPressed: () async {
        AuthService _auth = AuthService();
        await _auth.signOut();
      },
      icon: Icon(
        Icons.person,
        color: Colors.white,
      ),
      label: Text(
        'Logout',
        style: TextStyle(color: Colors.white),
      ),
    )
  ],
);


 AppBar selectBar = AppBar(
  title: Text('1'),
  leading: Icon(Icons.close),
  actions: <Widget>[
    Icon(Icons.flag),
    Icon(Icons.delete),
    Icon(Icons.more_vert)
  ],
  backgroundColor: Colors.deepPurple,
);