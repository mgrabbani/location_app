import 'package:flutter/material.dart';
import 'package:location_app/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RunnerNameInput extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Runner Name'),
      ),
      body: Column(
        children: <Widget>[Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: "Enter Runner Name",
              //add icon outside input field
              icon: Icon(Icons.person),
            ),
          ),
        ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Save'),
              onPressed: () {
                _save();
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (context) => const HomePage(title: 'Bengal Tigers - Locations')));
              },
            ),
          ),
        ],
      ),
    );
  }

  _save() async {
    String name = _textFieldController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
  }

  _read() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _name = (prefs.getString('name') ?? "");
    print("Runner name read from file: $_name");
  }
}