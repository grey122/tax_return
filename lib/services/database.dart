
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxreturn/module/tax_selection_module.dart';


class DataBaseService{

  final String uid;
  DataBaseService({this.uid});


  //collection reference
  final CollectionReference taxDataCollection = Firestore.instance.collection('TaxData');
 // final DocumentReference taxDataReference = Firestore.instance.collection('TaxData').document();


  Future createUserData(
      String taxType,
      String industry,
      String subIndustry,
      String taxYear,
      String taxMonth,
      String character,
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

  //get brews stream
  Stream<List<Tax>> get taxes {
    return taxDataCollection.document(uid).collection('IndividualTaxData')
        .snapshots().map(_taxListFromSnapshot);

  }

}