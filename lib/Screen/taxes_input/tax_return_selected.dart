import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class TaxTypeSelected extends StatefulWidget {
  @override
  _TaxTypeSelectedState createState() => _TaxTypeSelectedState();
}

class _TaxTypeSelectedState extends State<TaxTypeSelected> {
  Map data = {};
  double totalSales;
  double disallowedExpenses;
  double doubleNetProfitBeforeTask;
  double sumLossBroughtFoward;
  double sumOfChargeableProfits;
  double balancedAdjustment;
  double capitalAllowance;
  double doublecTResult;

  String calcData =  'Your mothly task for the month ';

  String costOfSales = '';
  String stringChargeableProfit = '';
  String stringnNetProfitBeforeTask = '';
  String lossBroughtFoward = '';
  String stringMontlyTask;
  final myControllerTf3 = TextEditingController();
  final myControllerTf2 = TextEditingController();
  final myControllerTf4 = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myControllerTf2.dispose();
    myControllerTf3.dispose();
    myControllerTf4.dispose();
    super.dispose();
  }

 void _grossProfit() {
    setState(() {
      double costOfSalesInt = double.parse(myControllerTf2.text);
      doublecTResult = totalSales - costOfSalesInt;
      costOfSales = curencyConverter(doublecTResult);
    });
  }
  void _netProfitBeforeTasks(){
    setState(() {
      //double intCostOfSales = double.parse(costOfSales);
      double intGeneralAdminExp = double.parse(myControllerTf3.text);
      doubleNetProfitBeforeTask = doublecTResult - intGeneralAdminExp;
      stringnNetProfitBeforeTask = curencyConverter(doubleNetProfitBeforeTask);
    });
  }


  // converts double into currency
  String curencyConverter(double currencyFormat) {
    FlutterMoneyFormatter fmf = FlutterMoneyFormatter(amount: currencyFormat);
    return fmf.output.withoutFractionDigits;
  }

  @override
  void initState() {
    myControllerTf3.addListener(_grossProfit);
    myControllerTf4.addListener(_netProfitBeforeTasks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(data['taxReturnedselect']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Divider(
              height: 10.0,
              thickness: 2.0,
              color: Colors.grey[300],
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Tax Return for ' +
                        data['taxYear'] +
                        ' ' +
                        data['taxMonth'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 10.0,
              thickness: 2.0,
              color: Colors.grey[300],
            ),
            //TODO: PLEASE FIX THE REMAINING TF(*)
            // (TF1,2)TURNOVER AND COST OF SALES
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: new InputDecoration(labelText: "Turn over/total Sales"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onChanged: (text) {
                      totalSales = double.parse(text);
                    },
                  ),
                  new TextField(
                      controller: myControllerTf2,
                      decoration:
                          new InputDecoration(labelText: "Cost of sales"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      textInputAction: TextInputAction.done,
                      onSubmitted: (text) {
                        setState(() {
                          _grossProfit();
                          FocusScope.of(context).unfocus();
                        });
                      }),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            //ED 1 SUM OF GROSS PROFIT
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'turnOver - cost of sale',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Gross Profit:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(25.0, 0, 10.0, 0),
                        decoration: ShapeDecoration(
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
                        ),
                        child: Text(
                          costOfSales,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            //TF3
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
              child: Column(
                children: <Widget>[
                  TextField(
                      controller: myControllerTf3,
                      decoration: new InputDecoration(
                        labelText: "General Admin Expenses",
                        hintText:
                            "", //TODO: PLEASE ADD THE GENERAL ADMIN TEXT HERE
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      textInputAction: TextInputAction.done,
                      onSubmitted: (text) {
                        setState(() {
                          //double intCostOfSales = double.parse(costOfSales);
                          double intGeneralAdminExp = double.parse(text);
                          doubleNetProfitBeforeTask = doublecTResult - intGeneralAdminExp;
                          stringnNetProfitBeforeTask = curencyConverter(doubleNetProfitBeforeTask);
                        });
                      }),
                ],
              ),
            ),

            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Gross profit - GAE',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Net Profit(Before Tax):',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    flex: 3,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(25.0, 0, 10.0, 0),
                        decoration: ShapeDecoration(
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
                        ),
                        child: Text(
                          stringnNetProfitBeforeTask,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            //TF4,5 (dissallowed expenses and non taxable income)
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: myControllerTf4,
                    decoration:
                        new InputDecoration(labelText: "Disallowed Expenses"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onChanged: (text) {
                      disallowedExpenses = double.parse(text);
                    },
                  ),
                  new TextField(
                      decoration:
                          new InputDecoration(labelText: "Non Taxable Income"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      textInputAction: TextInputAction.done,
                      onSubmitted: (text) {
                        setState(() {
                          double nonTaxableIncomeDouble = double.parse(text);
                          double cTResult =
                              disallowedExpenses + nonTaxableIncomeDouble;
                          sumLossBroughtFoward =
                              doubleNetProfitBeforeTask - cTResult;
                          lossBroughtFoward =
                              curencyConverter(sumLossBroughtFoward);
                          FocusScope.of(context).unfocus();
                        });
                      }),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'turnOver - cost of sale',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Loss Brought Foward: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    flex: 4,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(25.0, 0, 10.0, 0),
                        decoration: ShapeDecoration(
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
                        ),
                        child: Text(
                          lossBroughtFoward,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            //tf6,7,8 BA, PUC, CA
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration:
                        new InputDecoration(labelText: "Balanced Adjustment"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onChanged: (text) {
                      balancedAdjustment = double.parse(text);
                    },
                  ),
                  TextField(
                    decoration:
                        new InputDecoration(labelText: "Capital Allowance"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    textInputAction: TextInputAction.next,
                    onSubmitted: (_) => FocusScope.of(context).nextFocus(),
                    onChanged: (text) {
                      capitalAllowance = double.parse(text);
                    },
                  ),
                  new TextField(
                      decoration:
                          new InputDecoration(labelText: "Paid up Capital"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      textInputAction: TextInputAction.done,
                      onSubmitted: (text) {
                        setState(() {
                          double paidUpCapital = double.parse(text);
                          double cTResult = capitalAllowance +
                              balancedAdjustment +
                              paidUpCapital;
                          sumOfChargeableProfits =
                              sumLossBroughtFoward - cTResult;
                          stringChargeableProfit =
                              curencyConverter(sumOfChargeableProfits);
                          FocusScope.of(context).unfocus();
                        });
                      }),
                ],
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'turnOver - cost of sale',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 10.0,
                            color: Colors.grey[400],
                          ),
                        ),
                        Text(
                          'Chargable Profit: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25.0, 0, 10.0, 0),
                      decoration: ShapeDecoration(
                        color: Colors.grey[850],
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 2.0,
                            style: BorderStyle.solid,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                      child: Text(
                        stringChargeableProfit,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 15.0, 50.0, 30.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.blueGrey)),
                  onPressed: () {
                    setState(() {
                      double montlyTask = sumOfChargeableProfits * 50 / 100;
                      stringMontlyTask = curencyConverter(montlyTask);
                    });
                    },
                  color: Colors.black,
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      letterSpacing: 3.0,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 10.0,
              thickness: 3.0,
              color: Colors.grey[500],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 40.0),
              child: Text(
                stringMontlyTask ??  calcData ,
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
