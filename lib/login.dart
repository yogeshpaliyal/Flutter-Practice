import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final etPassword = TextEditingController();
  final etEmail = TextEditingController();
  final etPhone = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: etEmail,
                      decoration: InputDecoration(labelText: "Email"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextField(
                      controller: etPhone,
                      decoration: InputDecoration(labelText: "Phone"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                    ),
                    TextField(
                      controller: etPassword,
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(labelText: "Password"),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Container(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        print("TestingValue => ${etPassword.text}");
                        showDialog(
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
                            });
                      },
                      color: Colors.amber,
                      child: Text("Login"),
                    )
                  ],
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
