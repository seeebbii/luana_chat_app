import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/controllers/worker_controller.dart';
import 'package:luana_chat_app/views/video_call/call_screen.dart';
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
  final workerController = Get.find<WorkerController>();

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  bool loved = false;

  int currentWorker = 0;

  Timer? _timer;
  int _start = 5;

  void startTimer() {
    const oneSec = const Duration(milliseconds: 1000);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            if (workerController.allWorkers.length - 1 == currentWorker) {
              currentWorker = 0;
            } else {
              ++currentWorker;
            }
            _start = 5;
            startTimer();
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
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      '${workerController.allWorkers[currentWorker].status}'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                          'Age: ${workerController.allWorkers[currentWorker].age}'),
                      const SizedBox(width: 15),
                      Text(
                          'Level : ${workerController.allWorkers[currentWorker].email}'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Bio'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
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
                    Center(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => CallScreen(
                                    uid: workerController
                                        .allWorkers[currentWorker].id,
                                  ));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.35,
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: FittedBox(
                                fit: BoxFit.fill,
                                child: workerController
                                                .allWorkers[currentWorker]
                                                .imageUrl ==
                                            '' ||
                                        workerController
                                                .allWorkers[currentWorker]
                                                .imageUrl ==
                                            null
                                    ? Image.network(
                                        'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg')
                                    : Image.network(
                                        '${workerController.allWorkers[currentWorker].imageUrl}'),

                                // VideoPreview(
                                //     videoPlayerController:
                                //     VideoPlayerController.asset(
                                //       'assets/videos/video_bio.mp4',
                                //     ),
                                //     looping: true,
                                //     autoplay: true)
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                        ],
                      ),
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
                loved
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            "You liked her. Please wait for her response",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : const Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Center(child: Text(""))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Skip'),
                      onPressed: () {
                        setState(() {
                          _start = 0;
                        });
                      },
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
