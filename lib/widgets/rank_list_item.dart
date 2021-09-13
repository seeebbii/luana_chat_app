import 'package:flutter/material.dart';

class RankListItem extends StatelessWidget {
  RankListItem({
    Key? key,
    required this.rank,
  }) : super(key: key);

  final String? rank;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: CircleAvatar(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Text(
                  rank!,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            radius: 50,
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/1680172/pexels-photo-1680172.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
          ),
        ),
        Text(
          'LOLO 10',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
