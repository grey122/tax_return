import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/module/tax_selection_module.dart';

class TaxTile extends StatelessWidget {

  final Tax tax;

  TaxTile({ this.tax});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown,
          ),
          title: Text(tax.taxType),
          subtitle: Text(tax.industry),

        ),
      ),
    );
  }
}
