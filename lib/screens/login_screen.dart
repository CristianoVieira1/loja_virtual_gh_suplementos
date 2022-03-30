import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as prefix0;
import 'package:loja_virtual/models/user_model.dart';
import 'package:loja_virtual/screens/reset_password.dart';
import 'package:loja_virtual/screens/signup_screen.dart';

import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  static final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "ENTRAR",
            style: TextStyle(color: Colors.deepOrange),
          ),
          centerTitle: true,
          backgroundColor: Colors.black.withOpacity(1),
          actions: <Widget>[],
        ),
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
            image: AssetImage("images/banner2.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.hardLight,
          ),
                   Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 50, bottom: 32, left: 10),
                                child: Image.asset(
                                  "images/logo.png",
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.contain,
                                ),
                                
                              )
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 60.0, left: 20.0, right: 20.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.person_outline,
                                          color: Colors.white,
                                        ),
                                        labelText: 'E-MAIL',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70,),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orangeAccent))),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (text) {
                                      if (text.isEmpty || !text.contains("@"))
                                        return "E-mail inválido";
                                    },
                                  ),
                                  SizedBox(height: 20.0),
                                  TextFormField(
                                    controller: _passController,
                                    decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.white70,
                                        ),
                                        labelText: 'SENHA',
                                        labelStyle: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white70),
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.orange))),
                                    obscureText: true,
                                    validator: (text) {
                                      if (text.isEmpty || text.length < 6)
                                        return "Senha inválida";
                                    },
                                  ),

                                  Container(
                                    alignment: Alignment(1.0, 0.0),
                                    padding:
                                        EdgeInsets.only(top: 2.0, left: 20.0),
                                    child: FlatButton(
                                      child: Text(
                                        'Esqueceu a Senha',
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                            decoration:
                                                TextDecoration.none),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ResetPassword()
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
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
                                            'LOGIN',
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
                                            if (_formKey.currentState.validate()) {}
                                   model.signIn(
                                                email: _emailController.text,
                                                pass: _passController.text,
                                                onSuccess: _onSuccess,
                                                onFail: _onFail
                                            );
                                          },

                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                ],
                              )),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Ainda não tem uma conta ?',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(width: 2.0),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              )
                            ],
                          )
                        
                    ],
                  ),
                )
              ]);
          },
        ));
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao fazer Login!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
