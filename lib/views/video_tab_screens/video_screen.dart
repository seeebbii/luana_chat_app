import 'package:flutter/material.dart';

import 'active_screen.dart';
import 'latest_screen.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<Widget> myPages = [ActiveScreen(), LatestScreen()];

  int _selectedPage = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                    child: TabBar(
                      indicatorColor: Colors.black,
                      isScrollable: true,
                      labelColor: Colors.pink,
                      unselectedLabelColor: Colors.white,
                      labelStyle:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: "Active",
                        ),
                        Tab(
                          text: "Latest",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: [ActiveScreen(), LatestScreen()],
            )),
      ),
    );
  }
}
