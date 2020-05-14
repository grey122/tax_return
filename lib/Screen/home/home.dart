import 'package:flutter/material.dart';
import 'package:taxreturn/Screen/home/app_bars.dart';
import 'package:taxreturn/Screen/home/taxMoneyStreamer.dart';
import 'package:taxreturn/Screen/home/tax_list.dart';
import 'package:taxreturn/module/tax_selection_module.dart';
import 'package:taxreturn/services/auth.dart';
import 'package:taxreturn/module/user.dart';
import 'package:provider/provider.dart';
import 'package:taxreturn/services/database.dart';
import 'package:taxreturn/shared/constant.dart';

class Home extends StatefulWidget {
//Todo if widget is empty add text (please add task)
  AppBar appBar;
  Home({this.appBar});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    widget.appBar = defaultAppBar;
    final user = Provider.of<User>(context);
    AuthService _auth = AuthService();
    return StreamProvider<List<Tax>>.value(
      value: DataBaseService(uid: user.uid).taxes,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: widget.appBar ,


        body: TaxMoneyStreamer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: please look for a way to implement transictions
            Navigator.pushNamed(context, '/taxReturn');
          },
          child: Icon(Icons.add, size: 35.0,),
        ),
      ),
    );
  }
}
