import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/spinner_taxlist_item.dart';

class TaxReturn extends StatefulWidget {
  @override
  _TaxReturnState createState() => _TaxReturnState();
}



class _TaxReturnState extends State<TaxReturn> {
  List <TaxType> _taxType = TaxType.listTaxType();
  List <DropdownMenuItem<TaxType>> _dropdownMenuItems;
  TaxType _selectTaxType;

  @override
  void initState() {
    _dropdownMenuItems = buildDropDownMenuItems(_taxType);
    _selectTaxType = _dropdownMenuItems[0].value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tax Return'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 0),
        child: Column(

          children: <Widget>[
            Text(
              'choose tax type', // result should be displayed in the next page tab,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2.0, style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),

                ),
              ),
              padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: DropdownButton(
                value: _selectTaxType,
                items: _dropdownMenuItems,
                onChanged: onChangeDropDownItem,
//                style: TextStyle(
//                  letterSpacing: 1.0,
//                  fontWeight: FontWeight.bold,
//                ),
              ),
            )

              ],


        ),

      ) ,

    );
  }

  List<DropdownMenuItem<TaxType>> buildDropDownMenuItems(List taxTypes) {
    List<DropdownMenuItem<TaxType>> items = List();
    for(TaxType taxType in taxTypes){
      items.add(
          DropdownMenuItem(
            value: taxType,
            child: Text(taxType.name),
          ),
      );
    }
    return items;

  }

   onChangeDropDownItem(TaxType value) {
    setState(() {
      _selectTaxType = value;
    });
  }
}
