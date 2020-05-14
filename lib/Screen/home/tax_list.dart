import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxreturn/Screen/home/home.dart';
import 'package:taxreturn/Screen/home/tax_tiles/tax_tiles_number.dart';
import 'package:taxreturn/Screen/home/tax_tiles/tax_tiles_texts.dart';
import 'package:taxreturn/module/tax_selection_module.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taxreturn/shared/constant.dart';

class TaxList extends StatefulWidget {
  @override
  _TaxListState createState() => _TaxListState();
}

class _TaxListState extends State<TaxList> {

  AppBar appBar;


  @override
  Widget build(BuildContext context) {


    final taxes = Provider.of<List<Tax>>(context) ?? [];
    final taxesMoney = Provider.of<List<TaxMoney>>(context) ?? [];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: taxes.length,
      itemBuilder: (context, index){
        final List<Widget> steps = [
          TaxTileText(tax: taxes[index],),
          TaxTileNumber(taxMoney:taxesMoney[index]),
        ];
        return  InkWell(
          onTap: () {


          },
          child: Container(
            height: 220,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return steps[index];
              },
              loop: false,
              itemCount: steps.length,
              viewportFraction: 0.98,

            ),
          ),
        );

      },

    );
  }
}
