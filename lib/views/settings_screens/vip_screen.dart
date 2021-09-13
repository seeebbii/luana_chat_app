import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'VIP',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink,
                gradient: profileGradient,
              ),
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          'Unique Logo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Container(
                        child: Text('Vip has a unique identity'),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                for (var i = 0; i < 4; i++)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey.shade500,
                    ),
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                '3 Days',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 7),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 1, horizontal: 8),
                                decoration: BoxDecoration(
                                  gradient: yellowGradient,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 5),
                                      child: Image.asset(
                                        'assets/images/crown.png',
                                        width: 25,
                                        height: 25,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                    Text(
                                      'VIP',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 7, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: pinkGradient,
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink,
                          ),
                          child: Text(
                            '\$2.99',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
