import 'package:flutter/material.dart';

class AccountBinding extends StatelessWidget {
  const AccountBinding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Account Binding',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            margin: const EdgeInsets.only(top: 2),
            width: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Guest342342',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    'Current login mode: guest login',
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            color: Colors.black,
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15, left: 12),
              child: Text(
                'Account Management',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            color: Colors.black,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Bind your phone number'),
                  ),
                  Container(
                    child: TextButton(
                      child: Text('Bind now'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 2),
            color: Colors.black,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Bind your Facebook'),
                  ),
                  Container(
                    child: TextButton(
                      child: Text('Bind now'),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
