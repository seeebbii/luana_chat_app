import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/views/video_call/index.dart';
import 'package:luana_chat_app/views/video_call/video_preview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class MatchScreen extends StatefulWidget {
  MatchScreen({Key? key}) : super(key: key);

  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  AuthController auth = Get.put(AuthController());

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  bool loved = false;

  Timer? _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Future<void> onJoin() async {
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _chewieController!.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(''),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${auth.onlineUser.toString()}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Age'),
                  SizedBox(width: 15),
                  Text('Level'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Bio'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'If you don\'t skip or love for 5 seconds you\'ll be redirected to other user',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                '${_start}',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        height: 300,
                        width: 200,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: VideoPreview(
                              videoPlayerController:
                                  VideoPlayerController.asset(
                                'assets/videos/video_bio.mp4',
                              ),
                              looping: true,
                              autoplay: false),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                ),
                Positioned(
                  bottom: 25,
                  left: 140,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      size: 60,
                      color: loved ? Colors.pink : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        loved = !loved;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Center(
                child: ElevatedButton(
                  child: Text('Skip'),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
