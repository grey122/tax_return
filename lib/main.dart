import 'package:taxreturn/Screen/home/tax_return.dart';
import 'package:taxreturn/Screen/home/tax_return_selected.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/Screen/wraper.dart';
import 'package:taxreturn/module/user.dart';
import 'package:taxreturn/practice_test.dart';
import 'package:provider/provider.dart';
import 'package:taxreturn/services/auth.dart';


void main() => runApp(Home());


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(

        home: Wrapper(),

      ),
    );
  }
}
  //  title: 'Tax Return',
  //     initialRoute: '/',
  //     routes: {
  //       '/': (context) => TaxReturn(),
  //       '/taxReturnSelected': (context) => TaxTypeSelected(),
  //       '/practiceTest': (context) => PracticeTest(),

