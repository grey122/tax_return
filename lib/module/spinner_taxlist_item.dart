
class TaxType{
  int id;
  String name;
  TaxType(this.name);
  // TODO: PLEASE GIVE ALL THIS THE APPORIATE DATA SET TO USE
  static List <String> listTaxType(){
    return <String>[
      ('Please choose a location'), ('Company Income Task'), ('two'), ('three'), ('four'),
    ];
  }

  static List <String> listIndustry() {
    return <String>[
      ('banking and finance'),
      ('we will mak')
    ];
  }

  static List <String> subIndustryList() =>
      <String>[
        ('bank'),
        ('office'),
      ];
  //TODO: PLEASE LOOK FOR A BETTER WAY TO STORE THIS DATA
  static List<String> taskYear () =>
      <String>[
        ('2013 - 2014'),
        ('2014 - 2015'),
        ('2015 - 2016'),
        ('2016 - 2017'),
        ('2017 - 2018'),
        ('2018 - 2019'),
        ('2019 - 2020'),
      ];
  //TODO: AND THESE TOO; WE NOT CAVEMEN ....
  static List<String> taskMonth () =>
      <String>[
        ('Jan'),
        ('Feb'),
        ('March'),
        ('Apr'),
        ('May'),
        ('June'),
        ('July'),
        ('Aug'),
        ('Sept'),
        ('Oct'),
        ('Nov'),
        ('Dec')
      ];


}