import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxreturn/module/spinner_taxlist_item.dart';
import 'package:taxreturn/services/database.dart';
import 'package:taxreturn/shared/constant.dart';
import 'package:taxreturn/module/user.dart';
import 'package:provider/provider.dart';



class TaxReturn extends StatefulWidget {
  @override
  _TaxReturnState createState() => _TaxReturnState();
}

class _TaxReturnState extends State<TaxReturn> {
  //declare the string list , and selected string
  List<String> _list = TaxType.listTaxType();
  List<String> _listIndustry = TaxType.listIndustry();
  List<String> _listSubIndustry = TaxType.subIndustryList();
  List<String> _listTaskYear = TaxType.taskYear();
  List<String> _listTaskMonth = TaxType.taskMonth();
  String _selectedTaxType = 'Please choose a location';
  String _selectedIndustry = 'banking and finance';
  String _selectedTaxYear = '2013 - 2014';
  String _selectedTaxMonth = 'Jan';
  String _selectedSubIndustry;
  //database id and instance


  //enum initialization
  SingingCharacter _character = SingingCharacter.zero_to_four_years;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    DataBaseService dataBaseService = DataBaseService(uid: user.uid);

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(

        title: Text(
            'Tax Return'
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //CHOOSE TAX TYPE
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(

                    'choose tax type',
                    // result should be displayed in the next page tab,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 22.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    padding: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                    decoration: dropDownContainer,

                    child: DropdownButton(
                      isExpanded: true,
                      hint: Text('Please choose a location'),
                      // Not necessary for Option 1
                      value: _selectedTaxType,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedTaxType = newValue;
                        });
                      },
                      items: _list.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),

                  ),

                ],

              ),

            ),

            Divider(
              height: 40.0,
              thickness: 4.0,
              color: Colors.grey[300],
            ),
                Padding(
                  // CHOOSE INDUSTRY
                  // TODO: IMPLEMENT TEXTABLE DROP DOWN BUTTON
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Industry',
                        // result should be displayed in the next page tab,
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 100.0, 0.0),
                        decoration: dropDownContainer,
                        child: new DropdownButton(
                          hint: Text('Please choose a location'),
                          isExpanded: true,
                          value: _selectedIndustry,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedIndustry = newValue;

                            });
                          },
                          items: _listIndustry.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 7.0),
                      //CHOOSE OTHER INDUSTRY
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 140.0, 0.0),
                        decoration: dropDownContainer,
                        child: new DropdownButton(
                          hint: Text(
                            'Sub_industry(if applicable)...',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),

                          ),
                          isExpanded: true,
                          value: _selectedSubIndustry,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedSubIndustry = newValue;
                            });
                          },
                          items: _listSubIndustry.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),


                      ),
                      SizedBox(height: 10.0,),

                      // CHECK BOX IMPLEMENTATION
                      Text(
                        'Number of Years in Operation',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 22.0,
                          letterSpacing: 2.0,
                        ),

                      ),
                      Row(
                        children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: const Text('0 - 4 years'),
                                  leading: Radio(
                                    value: SingingCharacter.zero_to_four_years,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: ListTile(
                                  title: const Text('More than four years'),
                                  leading: Radio(
                                    value: SingingCharacter.more_than_four_years,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),


                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 40.0,
                  thickness: 4.0,
                  color: Colors.grey[300],
                ),
            Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Column(

                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Text(
                            'Assignment Task Year',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 20.0,
                            ),
                            ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                            'Month',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 20.0,
                            ),
                            ),
                      ),
                    ],
                  ),

                  Row(

                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),

                          decoration:dropDownContainer,
                          child: new DropdownButton(
                            hint: Text('Please choose a location'),
                            isExpanded: true,
                            value: _selectedTaxYear,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedTaxYear = newValue;
                              });
                            },
                            items: _listTaskYear.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),

                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(5.0, 0, 10.0, 0),
                          decoration: dropDownContainer,
                          child: new DropdownButton(
                            hint: Text('Please choose a location'),
                            isExpanded: true,
                            value: _selectedTaxMonth,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedTaxMonth = newValue;
                              });
                            },
                            items: _listTaskMonth.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),

                      ),


                    ],
                  ),
                ],
              ),
            ),
//
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 20.0, 20.0, 50.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),

                  ),
                  onPressed: () {
                    String _selectedCharacter = _character.toString();


                    print('database successful');
                    Navigator.pushNamed( context, '/taxReturnSelected', arguments:{
                      'selectedTaxType': _selectedTaxType,
                      'taxYear': _selectedTaxYear,
                      'taxMonth': _selectedTaxMonth,
                      'selectedIndustry': _selectedIndustry,
                      'selectedSubIndustry': _selectedSubIndustry,
                      'selectedCharacter': _selectedCharacter

                    });
                  },
                  color: Colors.red,
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                    ),
                  ),

                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

enum SingingCharacter { zero_to_four_years, more_than_four_years}
