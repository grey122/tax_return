import 'package:flutter/material.dart';
import 'package:taxreturn/Screen/home/tax_list.dart';
import 'package:provider/provider.dart';
import 'package:taxreturn/module/tax_selection_module.dart';
import 'package:taxreturn/module/user.dart';
import 'package:taxreturn/services/database.dart';
class TaxMoneyStreamer extends StatefulWidget {
  @override
  _TaxMoneyStreamerState createState() => _TaxMoneyStreamerState();
}

class _TaxMoneyStreamerState extends State<TaxMoneyStreamer> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<TaxMoney>>.value(
        value: DataBaseService(uid: user.uid).taxesMoney,
        child: TaxList()
    );
  }
}
