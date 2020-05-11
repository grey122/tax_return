import 'package:flutter/material.dart';
import 'package:taxreturn/module/tax_selection_module.dart';
import 'package:taxreturn/shared/constant.dart';
class TaxTileNumber extends StatelessWidget {
  final Tax tax;

  TaxTileNumber({this.tax});
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
                          style: textStyleItalicThin,
                        )),

                    Expanded(child: Text(tax.industry, style: textStyleMedium)),
                    SizedBox(
                      height: 5.0,
                    ),
//Todo: add matches
                    Expanded(
                        child: Text(
                          'Net Profit Before Tax',
                          style: textStyleItalicThin,
                        )),
                    Expanded(
                        child: Text(
                          tax.industryName,
                          style: textStyleMedium,
                        )),
                    SizedBox(
                      height: 5.0,
                    ),

                    Expanded(
                        child: Text(
                          'Chargable Profit',
                          style: textStyleItalicThin,
                        )),
                    Expanded(
                        child: Text(
                          tax.taxYear,
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
                      child: Text(tax.taxType),
                    )
                  ],
                ),
             //   Divider(height: 1,),
                RichText(
                  text: TextSpan(
                    text: 'Tax Return\n',
                      style: textStyleItalicThin.copyWith(color: Colors.black, ),
                      children: <TextSpan>[
                  TextSpan(text: tax.taxMonth, style: textStyleMedium.copyWith(height: 1.0)),
                ],
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
