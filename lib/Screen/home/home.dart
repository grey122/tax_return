import 'package:flutter/material.dart';
import 'package:taxreturn/Screen/home/tax_list.dart';
import 'package:taxreturn/module/tax_selection_module.dart';
import 'package:taxreturn/services/auth.dart';
import 'package:taxreturn/module/user.dart';
import 'package:provider/provider.dart';
import 'package:taxreturn/services/database.dart';

class Home extends StatelessWidget {
//Todo if widget is empty add text (please add task)

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    AuthService _auth = AuthService();
    return StreamProvider<List<Tax>>.value(
      value: DataBaseService(uid: user.uid).taxes,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Home Tax Return'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: TaxList(),
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
