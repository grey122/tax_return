import 'package:flutter/material.dart';
import 'package:taxreturn/services/auth.dart';
class DefaultAppBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();
    return AppBar(
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
    );
  }
}
