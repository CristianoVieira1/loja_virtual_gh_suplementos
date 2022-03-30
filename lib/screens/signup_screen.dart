import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'login_screen.dart';
import 'dart:async';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  static final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );
              return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                    new Image(
            image: AssetImage("images/signup.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.hardLight,
          ),
              
            Form(
                key: _formKey,
                child: ListView(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top:90),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.person, size: 80, color: Colors.white70),
                      ],
                    ),
                  ),
                  Container(
                      padding:
                      EdgeInsets.only(top: 130.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                labelText: 'Nome Completo',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    ),
                                    
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),
                            validator: (text) {
                              if (text.isEmpty) return "Nome Inválido";
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'E-mail ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),
                            keyboardType: TextInputType.emailAddress,
                            validator: (text) {
                              if (text.isEmpty || !text.contains("@"))
                                return "E-Mail Inválido!";
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: _passController,
                            decoration: InputDecoration(
                                labelText: 'Senha ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),
                            obscureText: true,
                            validator: (text) {
                              if (text.isEmpty || text.length < 6)
                                return "Senha Inválida";
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: _addressController,
                            decoration: InputDecoration(
                                labelText: 'Endereço ',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.green))),
                            validator: (text) {
                              if (text.isEmpty) return "Endereço Inválido";
                            },
                          ),
                          SizedBox(height: 35.0),
                          Container(
                            height: 40.0,
                            width: 322.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.greenAccent,
                              color: Colors.deepOrange,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: RaisedButton(
                                  child: Text(
                                    'CRIAR CONTA',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                  color: Colors.deepOrange,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                      new BorderRadius.circular(30.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      Map<String, dynamic> userData = {
                                        "name": _nameController.text,
                                        "email": _emailController.text,
                                        "address": _addressController.text
                                      };

                                      model.signUp(
                                          userData: userData,
                                          pass: _passController.text,
                                          onSuccess: _onSuccess,
                                          onFail: _onFail);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 1.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                                child: Center(
                                  child: Text('Voltar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          color: Colors.white70)),
                                ),
                              ),
                            ),
                          ),
                        ],
                        
                      )),
                      
                ]),
                
            ),
              ]
            
                );
          },
          
          
        )
        
        );
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuário criado com sucesso!"),
      backgroundColor: Colors.cyan[400],
      duration: Duration(seconds: 2),
    ));
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.of(context).pop();
    });
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao criar usuário!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
