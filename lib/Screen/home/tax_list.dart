import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxreturn/Screen/home/tax_tile.dart';
import 'package:taxreturn/module/tax_selection_module.dart';

class TaxList extends StatefulWidget {
  @override
  _TaxListState createState() => _TaxListState();
}

class _TaxListState extends State<TaxList> {

  @override
  Widget build(BuildContext context) {
    final taxes = Provider.of<List<Tax>>(context) ?? [];



    return ListView.builder(
      itemCount: taxes.length,
      itemBuilder: (context, index){
        return TaxTile(tax: taxes[index]);

      },

    );
  }
}
