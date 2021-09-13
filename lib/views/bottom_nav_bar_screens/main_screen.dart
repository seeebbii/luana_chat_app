import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luana_chat_app/controllers/auth_controller.dart';
import 'package:luana_chat_app/service/database.dart';
import 'package:luana_chat_app/views/main_tab_screens/main_rank_screen.dart';
import 'package:luana_chat_app/views/main_tab_screens/followed_screen.dart';
import 'package:luana_chat_app/views/main_tab_screens/hot_screen.dart';
import 'package:luana_chat_app/views/main_tab_screens/search_screen.dart';
import 'package:luana_chat_app/views/video_tab_screens/latest_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TabBar(
                            indicatorColor: Colors.black,
                            isScrollable: true,
                            labelColor: Colors.pink,
                            labelPadding:
                                const EdgeInsets.symmetric(horizontal: 5),
                            unselectedLabelColor: Colors.white,
                            labelStyle: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            tabs: [
                              Tab(
                                text: "Hot",
                              ),
                              Tab(
                                text: "Followed",
                              ),
                              Tab(
                                text: "Latest",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 7),
                          child: Column(
                            children: [
                              Icon(Icons.language,
                                  size: 32, color: Colors.pink),
                              Text('Region', style: TextStyle(fontSize: 8))
                            ],
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        InkWell(
                          onTap: () {
                            Get.to(() => SearchScreen());
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              size: 32,
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03),
                        InkWell(
                          onTap: () {
                            Get.to(() => MainRankScreen());
                          },
                          child: Container(
                            child: Icon(
                              Icons.card_giftcard,
                              size: 32,
                              color: Colors.pink,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [
                HotScreen(),
                FollowedScreen(),
                LatestScreen(),
              ],
            )),
      ),
    );
  }
}
