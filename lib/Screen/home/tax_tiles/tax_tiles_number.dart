import 'package:flutter/material.dart';
import 'package:taxreturn/module/tax_selection_module.dart';

import 'package:taxreturn/services/database.dart';
import 'package:taxreturn/shared/constant.dart';
import 'package:provider/provider.dart';
class TaxTileNumber extends StatelessWidget {

  final TaxMoney taxMoney;

  TaxTileNumber({this.taxMoney});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Card(
        //main margin
        margin: EdgeInsets.fromLTRB(2.0, 2.0, 0.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                  width: 5.0, color: Colors.red, style: BorderStyle.solid),
            ),
          ),
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 6.0, 0.0),
          child: SizedBox(
            //height: 210.0,
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          'Total_Sales',
                          style: textStyleItalicThin.copyWith(height: 2.5),
                        )),

                    Expanded(child: Text(taxMoney.totalSales, style: numberStyleMedium)),
                    SizedBox(
                      height: 5.0,
                    ),
//Todo: add matches
                    Expanded(
                        child: Text(
                          'Net Profit Before Tax',
                          style: textStyleItalicThin.copyWith(height: 2.5),
                        )),
                    Expanded(
                        child: Text(
                          taxMoney.netProfitBeforeTax,
                          style: numberStyleMedium,
                        )),
                    SizedBox(
                      height: 5.0,
                    ),

                    Expanded(
                        child: Text(
                          'Chargable Profit',
                          style: textStyleItalicThin.copyWith(height: 2.5),
                        )),
                    Expanded(
                        child: Text(
                          taxMoney.chargeableProfit,
                          style: textStyleMedium,
                        )),
                    SizedBox(
                      height: 5.0,
                    ),


                    SizedBox(
                      height: 17.0,
                    ),
//clipRREct
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(taxMoney.dateIssued),
                    )
                  ],
                ),
              SizedBox(width: 70.0,),
             //   Divider(height: 1,),
                Align(
                  alignment: Alignment.centerRight,
                  child: FittedBox(
                    child: RichText(
                      text: TextSpan(
                        text: 'Tax Return\n',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300,
                            height: 1.0,
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                      TextSpan(text: taxMoney.taxReturn, style: numberStyleMedium.copyWith(fontSize: 40.0)),
                    ],
                    ),


                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}


//todo how to make vertical divider
