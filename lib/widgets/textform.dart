import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class TextFormWithDropdown extends StatefulWidget {
  @override
  _TextFormWithDropdownState createState() => _TextFormWithDropdownState();
}

class _TextFormWithDropdownState extends State<TextFormWithDropdown> {
  final textController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    textController.dispose();

    super.dispose();
  }

  Map<String, double> list = {'a': 1.2, 'b': 1.23, 'c': 1.24, 'd': 1.23};

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
                child: TextFormField(
                    controller: textController,
                    obscureText: false,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: false,
                    ),
                    decoration: InputDecoration(
                      icon: Image.asset(
                        'assets/backgrounds/icons/ic_lmax.png',
                        scale: 2.5,
                      ),
                      labelText: 'Length at Max',
                      labelStyle: TextStyle(fontFamily: 'Raleway'),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: kMainAccent, width: 2.0)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kMainColor)),
                    ))),
            DropdownButton(
              elevation: 8,
              isDense: true,
              iconSize: 30,
              items: <String>['a', 'b', 'c', 'd'].map((value) {
                return new DropdownMenuItem<String>(
                    onTap: () {
                      setState(() {
                        textController.text = (list[value]).toString();
                      });
                    },
                    child: Text(value));
              }).toList(),
              onChanged: (_) {},
            ),
          ],
        ));
  }
}
