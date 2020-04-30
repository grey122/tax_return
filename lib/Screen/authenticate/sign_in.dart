import 'package:flutter/material.dart';
import 'package:taxreturn/services/auth.dart';
import 'package:taxreturn/shared/constant.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {



  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Sign in to create_task'),
        actions: <Widget>[
          FlatButton.icon(

              icon: Icon(Icons.person),
              label: Text('register'),
            onPressed: (){
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0,),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
               SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },

              ),
              SizedBox(height: 20.0,),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                validator: (val) => val.length < 6 ? 'Enter passsword more that 5 char' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: Colors.brown,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signINWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() => error = 'could not sign in with those credintials');
                    }



                  }

                },
              ),
              SizedBox(height: 10.0,),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
        )
      ),
    );
  }
}
