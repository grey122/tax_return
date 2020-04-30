import 'package:flutter/material.dart';
import 'package:taxreturn/services/auth.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Tax Return'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'))
          ],

        ),
      ),
    );
  }
}