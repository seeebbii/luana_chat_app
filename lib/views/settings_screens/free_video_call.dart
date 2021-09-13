import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';

class FreeVideoCall extends StatelessWidget {
  const FreeVideoCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Get free video call',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/banner-free-call.png'),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white70,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Rules",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '1.  Recharge in the last 7 days',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.05),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '2.  After completing the above the conditions, you can receive 1 minute free video call duration every day',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "You haven't recharged in the last 7 days, you can't receive free call duration",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.15),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "[The task is not completed, please continue to cheer]",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
                  decoration: BoxDecoration(
                      gradient: pinkGradient,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Receive free call duration',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
