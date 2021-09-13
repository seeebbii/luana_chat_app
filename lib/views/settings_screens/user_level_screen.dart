import 'package:flutter/material.dart';

class UserLevelScreen extends StatelessWidget {
  const UserLevelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'User Level',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.white70,
            height: 1,
          ),
          preferredSize: Size.fromHeight(1),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'From 1 Behind ',
                  style: TextStyle(fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: '100 Diamonds',
                        style: TextStyle(color: Colors.pink, fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
          Text(
            'How do user updrade thier level?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
