import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app_1/components/gender_horizontal.dart';
import 'file:///C:/Users/paliy/AndroidStudioProjects/sample_app_1/lib/screens/dashboard/dashboard.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = "/register";

  @override
  Widget build(BuildContext context) {
    final _gender = "gender";

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
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: "Name",
                          icon: Icon(Icons.account_circle_outlined)),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email Address",
                          icon: Icon(Icons.email_outlined)),
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardAppearance: Brightness.dark,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Password",
                          icon: Icon(Icons.lock_outline)),
                    ),
                    GenderHorizontal(),
                    RaisedButton(child: Text("Register"), onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) {
                        return DashboardPage();
                      },));
                    },)
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
