
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:taxreturn/module/tax_selection_module.dart';


class DataBaseService{

  final String uid;
  DataBaseService({this.uid});


  //collection reference
  final CollectionReference taxDataCollection = Firestore.instance.collection('TaxData');
 // final DocumentReference taxDataReference = Firestore.instance.collection('TaxData').document();


  Future createUserData(
     { String taxType,
      String industry,
      String subIndustry,
      String taxYear,
      String taxMonth,
      String character,}
      ) async{

      return await taxDataCollection.document(uid).collection('IndividualTaxData').add({
        'tax_type': taxType,
        'industry': industry,
        'sub_industry': subIndustry,
        'tax_year': taxYear,
        'tax_month': taxMonth,
        'character' : character,
      });
  }
  //user numbers Data

  //tax List from snapshot
  List<Tax> _taxListFromSnapshot(QuerySnapshot snapshot){
      return snapshot.documents.map((doc){
        return Tax(
          taxType: doc.data['tax_type'] ?? '',
          industry: doc.data['industry'] ?? '',
          industryName: doc.data['sub_industry'] ?? '',
          taxYear: doc.data['tax_year'] ?? '',
          character: doc.data['character'] ?? '',
          taxMonth: doc.data['tax_month'] ?? '',
        );
      }).toList();
  }

  Future createUserMoneyData(
      String totalSales,
      String netProfitBeforeTax,
      String chargeableProfit,
      String taxReturn,
      String dateIssued,

      ) async{

    return await taxDataCollection.document(uid).collection('IndividualTaxDataMoney').add({
      'total_sales': totalSales,
      'net_profit_before_Tax': netProfitBeforeTax,
      'chargeable_profit': chargeableProfit,
      'tax_return': taxReturn,
      'date_issued': dateIssued,

    });
  }
  //tax List Money from snapshot
  List<TaxMoney> _taxListMoneyFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return TaxMoney(
        totalSales: doc.data['total_sales'] ?? '',
        netProfitBeforeTax: doc.data['net_profit_before_Tax'] ?? '',
        chargeableProfit: doc.data['chargeable_profit'] ?? '',
        taxReturn: doc.data['tax_return'] ?? '',
        dateIssued: doc.data['date_issued'] ?? '',
      );
    }).toList();
  }


  //get taxDocument stream
  Stream<List<Tax>> get taxes {
      return taxDataCollection.document(uid).collection('IndividualTaxData')
          .snapshots().map(_taxListFromSnapshot);
  }
  //get taxMoney stream
  Stream<List<TaxMoney>> get taxesMoney {
    return taxDataCollection.document(uid).collection('IndividualTaxDataMoney')
        .snapshots().map(_taxListMoneyFromSnapshot);
  }

}