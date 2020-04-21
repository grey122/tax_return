import 'package:taxreturn/tax_return_selected.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/tax_return.dart';


void main() => runApp(Home());


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tax Return',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => TaxReturn(),
        '/taxReturnSelected': (context) => TaxTypeSelected(),
      },


    );
  }
}

