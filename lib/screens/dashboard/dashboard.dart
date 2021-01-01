import 'package:flutter/material.dart';
import 'package:sample_app_1/screens/dashboard/posts.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
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

  Widget _getBody(int index) {
    if (index == 0) {
      return Posts();
    }
  }
}
