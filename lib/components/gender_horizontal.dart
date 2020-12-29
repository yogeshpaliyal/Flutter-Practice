import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_1/values/strings.dart';

class GenderHorizontal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GenderHorizontalState();
  }
}

class _GenderHorizontalState extends State<GenderHorizontal> {
  var _groupValue = Strings.male;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(flex: 1,child:
        ListTile(
          title: const Text(Strings.male),
          leading: Radio(
            value: Strings.male,
            groupValue: _groupValue,
            onChanged: _updateState,
          ),
        )
      ),
      Expanded(flex: 1,
        child:
          ListTile(
            title: const Text(Strings.female),
            leading: Radio(
              value: Strings.female,
              groupValue: _groupValue,
              onChanged: _updateState,
            ),
          )
        ,
      )
    ]);
  }

  void _updateState(String value) {
    setState(() {
      _groupValue = value;
    });
  }
}
