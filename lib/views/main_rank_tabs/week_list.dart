import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';
import 'package:luana_chat_app/widgets/rank_list_item.dart';

class WeekList extends StatelessWidget {
  const WeekList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: charmGradient),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            RankListItem(
              rank: '1',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RankListItem(
                  rank: '2',
                ),
                RankListItem(
                  rank: '3',
                ),
              ],
            ),
            Spacer(),
            SafeArea(
              child: Column(
                children: [
                  rankList(context, '4', 'Suzi'),
                  Divider(
                    height: 0,
                    thickness: 2,
                    color: Colors.white70,
                  ),
                  rankList(context, '5', 'Sugar'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container rankList(BuildContext context, String rank, String name) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      color: Colors.black,
      child: Row(children: [
        Text(
          rank,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              'https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.1),
        Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ]),
    );
  }
}
