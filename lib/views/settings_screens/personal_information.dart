import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';

class PersonalInfromation extends StatelessWidget {
  PersonalInfromation({Key? key}) : super(key: key);

  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Personal Infromation',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.005),
          Container(
            color: Colors.black,
            child: ListTile(
              title: Text(
                'Profile Photo',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              width: double.infinity,
              color: Colors.white10,
              child: Text(
                'Basic Information',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              )),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('NickName'),
                  Row(
                    children: [
                      Obx(
                        () => Text(
                          '${_authController.loggedInUser.value.name}',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
                ],
              )),
          SizedBox(height: MediaQuery.of(context).size.width * 0.002),
          Container(
            color: Colors.black,
            child: ListTile(
              title: Text(
                'ID',
              ),
              trailing: Obx(
                () => Text(
                  '${_authController.loggedInUser.value.id?.replaceRange(7, _authController.loggedInUser.value.id!.length, "")}',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.002),
          Container(
            color: Colors.black,
            child: ListTile(
              title: Text(
                'Gender',
              ),
              trailing: Text(
                'Not Defined',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.002),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Age'),
                  Row(
                    children: [
                      Text(
                        '00',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
                ],
              )),
          SizedBox(height: MediaQuery.of(context).size.width * 0.002),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Height'),
                Row(
                  children: [
                    Text(
                      '000cm',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(width: 15),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              width: double.infinity,
              color: Colors.white10,
              child: Text(
                'Other Information',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              )),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Personal Signature'),
                  Row(
                    children: [
                      Text(
                        'Not filled',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(width: 15),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
