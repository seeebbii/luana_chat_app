import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';
import 'package:luana_chat_app/views/main_rank_tabs/day_list.dart';
import 'package:luana_chat_app/views/main_rank_tabs/week_list.dart';

class RichList extends StatelessWidget {
  const RichList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(gradient: charmGradient),
            child: Stack(
              children: [
                Scaffold(
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(40),
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        bottom: TabBar(
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.white,
                          isScrollable: true,
                          tabs: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('Day'),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Text('Week'),
                            )
                          ],
                        ),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    body: TabBarView(
                      children: [DayList(), WeekList()],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
