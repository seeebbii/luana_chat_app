import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';

class CallScreen extends StatelessWidget {
  CallScreen({Key? key}) : super(key: key);
  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'YOU ARE\nFRIENDS',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'You liked each other',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg'),
                      ),
                      CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              _authController.loggedInUser.value.imageUrl ==
                                      null
                                  ? NetworkImage('')
                                  : NetworkImage(_authController
                                      .loggedInUser.value.imageUrl!)),
                    ],
                  ),
                  Positioned(
                    bottom: 25,
                    left: 155,
                    child: Icon(Icons.favorite, color: Colors.red, size: 50),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Text(
                'She is inviting you to make a private call',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.red,
                      child:
                          Icon(Icons.call_end, size: 40, color: Colors.white),
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.call, size: 40, color: Colors.white),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
