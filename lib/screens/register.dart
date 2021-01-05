import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app_1/components/gender_horizontal.dart';
import 'package:sample_app_1/models/user_data.dart';
import 'package:sample_app_1/screens/dashboard/dashboard.dart';
import 'package:sample_app_1/utils/sharepref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";

  @override
  Widget build(BuildContext context) {
    final etName = TextEditingController();
    final etEmail = TextEditingController();
    final etPassword = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: etName,
                      textInputAction: TextInputAction.next,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(Icons.account_circle_outlined)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: etEmail,
                      textInputAction: TextInputAction.next,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50)),
                          prefixIcon: Icon(Icons.email_outlined),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: etPassword,
                      textInputAction: TextInputAction.next,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(5, 5)), ),
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GenderHorizontal(),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                        child: Text("Register"),
                        onPressed: () async {
                          var userData = User.blank();
                          userData.firstName = "Yogesh";
                          userData.lastName = "Paliyal";
                          userData.email = etEmail.text;
                          var sp = await SharedPreferences.getInstance();
                          sp.setString(SHARED_PREF_KEYS.LOGIN_DATA,
                              jsonEncode(userData.toJson()));
                          DashboardPage.start(context);
                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}
