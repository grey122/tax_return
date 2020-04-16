import 'package:taxreturn/tax_return_selected.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/tax_return.dart';

void main() => runApp(MaterialApp(

  home: TaxReturn(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        
        title: Text(
          '    ',

        ),
        centerTitle: true,

      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 0),
        child: Column(
          children: <Widget>[
            Text(
              'choose tax type', // result should be displayed in the next page tab,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                fontSize: 16.0,

              ),
            )

          ],

        ),

      ) ,
    );
  }
}

