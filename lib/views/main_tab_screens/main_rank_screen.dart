import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';
import 'package:luana_chat_app/views/main_rank_tabs/charm_list.dart';
import 'package:luana_chat_app/views/main_rank_tabs/rich_list.dart';

class MainRankScreen extends StatelessWidget {
  const MainRankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: charmGradient),
              ),
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.purple.shade800,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(10),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: IconButton(
                        icon: Icon(Icons.close, size: 40),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Container(
                      child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        indicatorColor: Colors.black,
                        isScrollable: true,
                        labelColor: Colors.pink,
                        unselectedLabelColor: Colors.white,
                        labelStyle: TextStyle(fontSize: 18),
                        tabs: [
                          Tab(
                            text: "Charm List",
                          ),
                          Tab(
                            text: "Rich List",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [CharmList(), RichList()],
          ),
        ),
      ),
    );
  }
}
