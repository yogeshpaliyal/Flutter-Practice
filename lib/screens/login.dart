import 'package:flutter/material.dart';
import 'package:sample_app_1/screens/dashboard/dashboard.dart';
import 'package:sample_app_1/screens/register.dart';
import 'package:sample_app_1/utils/sharepref_helper.dart';
import 'package:sample_app_1/utils/string_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                          if(value.isEmpty){
                            _result = "Please enter email";
                          }else if(!StringHelper.isValidEmail(value)){
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
                          if(value.isEmpty){
                            _result = "Please enter password";
                          }
                          return _result;
                        },
                      ),
                      Container(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () async {
                          if(_loginFormKey.currentState.validate()) {
                            var sp = await SharedPreferences.getInstance();
                            sp.setString(SHARED_PREF_KEYS.EMAIL, etEmail.text);
                            DashboardPage.start(context);
                          }

                          /*showDialog(
                              context: context,
                              builder: (BuildContext mContext) {
                                return AlertDialog(
                                  title: Text("Login Data"),
                                  content: Text(
                                      "Email => ${etEmail.text} \n Phone => ${etPhone.text} \n Password => ${etPassword.text}"),
                                  actions: [
                                    RaisedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Okay"),
                                    )
                                  ],
                                );
                              });*/
                        },
                        color: Colors.amber,
                        child: Text("Login"),
                      ),
                      FlatButton(
                        child: Text("new user? Register Now"),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {

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
}
