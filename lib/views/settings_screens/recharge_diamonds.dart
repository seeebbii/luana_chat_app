import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';

class RechargeDiamonds extends StatelessWidget {
  const RechargeDiamonds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Recharge Diamonds',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(gradient: pinkGradient),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 35),
                    child: Image.asset('assets/images/Diamond.png'),
                  ),
                  Container(
                    // margin: const EdgeInsets.symmetric(vertical: 42),
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text('0',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(
                          'Surplus Diamonds',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  for (var i = 1; i < 10; i++)
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Image.asset(
                                        'assets/images/Diamond.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '35 Diamonds',
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Image.asset(
                                        'assets/images/gift.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '3 Days VIP',
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.yellow),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text('19.99\$',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white70)),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 2,
                          color: Colors.white30,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01)
                      ],
                    ),
                ],
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                width: double.infinity,
                color: Colors.white30,
                child: Text(
                  'What are Diamonds for?',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                )),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: LinearGradientMask(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 35,
                            ),
                          ),
                        ),
                        Text('Call 1v1 video', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(4),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: LinearGradientMask(
                              child: Icon(
                                Icons.card_giftcard,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        Text('Give a gift', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
