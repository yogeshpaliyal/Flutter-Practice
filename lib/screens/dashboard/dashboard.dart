import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample_app_1/models/user_data.dart';
import 'package:sample_app_1/screens/dashboard/posts.dart';
import 'package:sample_app_1/utils/sharepref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = "/dashboard";

  static void start(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, routeName,(r)=> false);
  }

  @override
  State<StatefulWidget> createState() {
    //DashboardArgs.of

    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  var _selected_index = 0;
  var _title = "";
  _DashboardPageState(){
   _updateTitle();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _getBody(_selected_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        unselectedFontSize: 0,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(label: "Posts", icon: Icon(Icons.view_list)),
          BottomNavigationBarItem(
              label: "Notification", icon: Icon(Icons.notifications_rounded)),
          BottomNavigationBarItem(
              label: "Profile", icon: Icon(Icons.account_circle_rounded))
        ],
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  _updateTitle() async{
    var sp = await SharedPreferences.getInstance();
    var user = User.fromJson(jsonDecode(sp.getString(SHARED_PREF_KEYS.LOGIN_DATA)));
    setState(() {
      _title = user.firstName;
    });
  }

  Widget _getBody(int index) {
    if (index == 0) {
      return Posts();
    }
  }
}
