class TaxType{
  int id;
  String name;
  TaxType(this.name);

  static List <TaxType> listTaxType(){
    return <TaxType>[
      TaxType('Company Income Task'),
      TaxType('two'),
      TaxType('three'),
      TaxType('four'),
    ];
  }



}