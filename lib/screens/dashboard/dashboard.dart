import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  static const routeName = "/dashboard";

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
      body: Center(
        child: Text("Selected Item $_selected_index"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selected_index,
        unselectedFontSize: 0,
        onTap: _onItemTap,
        items: [
          BottomNavigationBarItem(
              label: "Home", icon: Icon(Icons.home_rounded)),
          BottomNavigationBarItem(
              label: "Notification", icon: Icon(Icons.notifications_rounded)),
          BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings))
        ],
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selected_index = index;
    });
  }
}
