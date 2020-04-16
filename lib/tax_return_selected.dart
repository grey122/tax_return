

import 'package:flutter/material.dart';

class TaxTypeSelected extends StatefulWidget {
  @override
  _TaxTypeSelectedState createState() => _TaxTypeSelectedState();
}

class _TaxTypeSelectedState extends State<TaxTypeSelected> {
  List<String> options = <String>['One', 'Two', 'Free', 'Four'];
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('edition'),
      ),


      );
  }
}
