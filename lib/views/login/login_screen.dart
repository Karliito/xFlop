import 'package:flop_edt_app/models/state/app_state.dart';
import 'package:flop_edt_app/state_manager/state_widget.dart';
import 'package:flop_edt_app/utils/constants.dart';
import 'package:flop_edt_app/views/login/password_forgot_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AppState state;
  bool userNoEmpty = false;
  bool passwordNoEmpty = false;
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    state = StateWidget.of(context).state;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    Constants.logoPath,
                    width: 100,
                  ),
                  Text(
                    'xFlop!',
                    style: theme.textTheme.headline4.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: userController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.accentColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.accentColor, width: 2.0)),
                    labelText: 'Username',
                    labelStyle: theme.textTheme.bodyText1,
                    hintText: 'Entrez un username'),
                style: theme.textTheme.bodyText1,
                onChanged: (value) {
                  if (userController.text != "") {
                    setState(() {
                      userNoEmpty = true;
                    });
                  } else {
                    setState(() {
                      userNoEmpty = false;
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.accentColor, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: theme.accentColor, width: 2.0)),
                    labelText: 'Mot de passe',
                    labelStyle: theme.textTheme.bodyText1,
                    hintText: 'Enter mot de passe'),
                style: theme.textTheme.bodyText1,
                onChanged: (value) {
                  if (passwordController.text != "") {
                    setState(() {
                      passwordNoEmpty = true;
                    });
                  } else {
                    setState(() {
                      passwordNoEmpty = false;
                    });
                  }
                },
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PasswordForgotScreen()),
                );
              },
              child: Text(
                'Mot de passe oublié ?',
                style: theme.textTheme.bodyText1,
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: (passwordNoEmpty & userNoEmpty
                    ? theme.accentColor
                    : Color(0xFF242424)),
                onPressed: () {
                  //== TODO ==
                  //
                  // login check
                  //
                  //==========
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Se connecter',
                  style: TextStyle(
                      color: (passwordNoEmpty & userNoEmpty
                          ? theme.textTheme.button.color
                          : theme.accentColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}