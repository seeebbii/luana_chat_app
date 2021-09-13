import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  const FeedBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'FeedBack',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Submit',
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration.collapsed(
                hintText:
                    'Please fill in your components or problems about using the product.',
                filled: true,
                fillColor: Colors.black),
            maxLines: 15,
          )
        ],
      ),
    );
  }
}
