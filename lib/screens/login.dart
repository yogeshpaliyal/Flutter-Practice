import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample_app_1/models/user_data.dart';
import 'package:sample_app_1/networking/LoginCaller.dart';
import 'package:sample_app_1/screens/register.dart';
import 'package:sample_app_1/utils/Resource.dart';
import 'package:sample_app_1/utils/Status.dart';
import 'package:sample_app_1/utils/sharepref_helper.dart';
import 'package:sample_app_1/utils/string_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/dashboard.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/login";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final etPassword = TextEditingController();
  final etEmail = TextEditingController();
  final etPhone = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login test"),
        ),
        body: Center(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 6,
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: etEmail,
                        decoration: InputDecoration(labelText: "Email"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          var _result;
                          if (value.isEmpty) {
                            _result = "Please enter email";
                          } else if (!StringHelper.isValidEmail(value)) {
                            _result = "Please enter valid email address";
                          }
                          return _result;
                        },
                      ),
                      TextFormField(
                        controller: etPassword,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(labelText: "Password"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          var _result;
                          if (value.isEmpty) {
                            _result = "Please enter password";
                          }
                          return _result;
                        },
                      ),
                      Container(
                        height: 20,
                      ),
                      LoadingMaterialButton(
                        email: etEmail, password: etPassword,),
                      FlatButton(
                        child: Text("new user? Register Now"),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              BuildContext context) {
                            return RegisterPage();
                          }));
                        },
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(),
                flex: 1,
              )
            ],
          ),
        ));
  }


  void handleLoginClick() async {
    /*var response = await LoginCaller().login(etEmail.text, etPassword.text);
    switch (response.status) {
      case Status.SUCCESS :
        var sp = await SharedPreferences.getInstance();
        sp.setString(
            SHARED_PREF_KEYS.LOGIN_DATA, jsonEncode(response.data.toJson()));
        // DashboardPage.start(context);
        break;
    }*/
  }
}

class LoadingMaterialButton extends StatefulWidget {
  TextEditingController email = null;
  TextEditingController password = null;

  LoadingMaterialButton({this.email, this.password});

  @override
  State<StatefulWidget> createState() {
    return LoadingMateriaButtonState();
  }

}

class LoadingMateriaButtonState extends State<LoadingMaterialButton> {

  var _isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Resource<User>>(
      stream: _isButtonClicked ?  LoginCaller().login(
          widget.email.text, widget.password.text) : null,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null && snapshot.data.status != null) {
          switch (snapshot.data.status) {
            case Status.SUCCESS:
              return Text("Login Success");
              break;
            case Status.ERROR:
              return Text(snapshot.data.message);
              break;
            case Status.LOADING:
              return CircularProgressIndicator();
              break;
            default :
              return Text("Default");
          }
        } else {
          return RaisedButton(child: Text("Login"),
            onPressed: () {
            setState(() {
              _isButtonClicked = true;
            });
          },);
        }
      },);
  }


}
