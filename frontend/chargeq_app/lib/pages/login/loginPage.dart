import 'package:chargeq_app/pages/loading/loadingPage.dart';
import 'package:chargeq_app/pages/main/mainPage.dart';
import 'package:chargeq_app/res/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InitialStartupPageState();
}

class _InitialStartupPageState extends State<LoginPage> {
  late TextEditingController _emailController, _passwordController;
  String? _errorMsg;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myGreen,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              LogoHero(),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Text("Welcome!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 40,
                child: TextFormField(
                  controller: _passwordController,
                  style: Theme.of(context).textTheme.button,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: const BorderRadius.all(const Radius.circular(10))),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "email",
                    labelStyle: Theme.of(context).textTheme.button!.copyWith(color: Colors.black87),
                    //fillColor: Colors.green
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  controller: _emailController,
                  style: Theme.of(context).textTheme.button,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none, borderRadius: const BorderRadius.all(const Radius.circular(10))),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "password",
                    labelStyle: Theme.of(context).textTheme.button!.copyWith(color: Colors.black87),
                    //fillColor: Colors.green
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: OutlineButton(
                          borderSide: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Text("Register", style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: Text("Log in", style: TextStyle(color: Colors.black87)),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            //TODO login
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
