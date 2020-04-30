import 'package:flutter/material.dart';
import 'package:taxreturn/Screen/authenticate/authenticate.dart';
import 'package:taxreturn/Screen/home/home.dart';
import 'package:taxreturn/module/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
