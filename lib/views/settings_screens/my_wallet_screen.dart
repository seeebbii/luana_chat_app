import 'package:flutter/material.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        title: Text('My Wallet',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            color: Colors.pink,
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 5),
                    child:
                        Text("Today's gains", style: TextStyle(fontSize: 18))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                    child: Text('0 Diamond',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                    child: Text('Historical gains: 0',
                        style: TextStyle(fontSize: 18))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Live streaming income',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.009),
                            Text('0 Diamond',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12))
                          ],
                        ),
                        Column(
                          children: [
                            Text('Gift income',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.009),
                            Text('0 Diamond',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12))
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black),
            child: ListTile(
              title: Text('Budget Record',
                  style: TextStyle(color: Colors.white60, fontSize: 17)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
