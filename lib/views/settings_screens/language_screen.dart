import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({Key? key}) : super(key: key);

  final List<String> language = [
    'English',
    'Arabic',
    'Dutch',
    'Chinese',
    'Japanese',
    'Espanol'
  ];

  var _isChecked = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ))
            ]),
        body: Column(
          children: [
            for (var index in language)
              Column(
                children: [
                  Divider(color: Colors.white70),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      title: Text(index, style: TextStyle(fontSize: 16)),
                      trailing: Icon(
                        Icons.check,
                        color: _isChecked == index
                            ? Colors.pink
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            Divider(color: Colors.white70),
          ],
        ));
  }
}
