import 'package:flutter/material.dart';
import 'package:tutorial_flutter_shared_prefs/prefs/preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PreferencesPage(title: 'Tutorial Flutter Shared Preferences'),
    );
  }
}

class PreferencesPage extends StatefulWidget {
  PreferencesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  final _controller = TextEditingController();
  String tutorialValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildTextField(),
            _buildTextFieldResult(),
            _buildSaveButton(),
            _buildReadButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: _controller,
      ),
    );
  }

  Widget _buildTextFieldResult() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(tutorialValue),
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
      child: Text('Save to Prefs'),
      onPressed: () async {
        Prefs.setTutorialString(_controller.text);
      },
    );
  }

  Widget _buildReadButton() {
    return RaisedButton(
      child: Text('Read from Prefs'),
      onPressed: () async {
        Prefs.tutorialString.then((value) {
          setState(() {
            tutorialValue = value;
          });
        });
      },
    );
  }

  @override
  void dispose() async {
    _controller.dispose();
    Prefs.clear();
    super.dispose();
  }
}
