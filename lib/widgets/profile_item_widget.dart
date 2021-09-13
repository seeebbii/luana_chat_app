import 'package:flutter/material.dart';
import 'package:luana_chat_app/utils/color_const.dart';

class ProfileItemWidget extends StatelessWidget {
  ProfileItemWidget(
      {Key? key, this.id, this.name, this.location, this.imageUrl})
      : super(key: key);

  final String? id;
  final String? name;
  final String? location;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          imageUrl!,
          fit: BoxFit.cover,
        ),
        header: Container(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 3, top: 2, bottom: 2),
                color: Colors.pink,
                child: Transform.rotate(
                  angle: 31,
                  child: Image.asset(
                    'assets/images/crown.png',
                    width: 25,
                    height: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10)),
                child: Container(
                    padding: const EdgeInsets.only(top: 7, bottom: 8, right: 5),
                    decoration: BoxDecoration(gradient: pinkGradient),
                    child: Text('The Best', style: TextStyle(fontSize: 12))),
              )
            ],
          ),
        ),
        footer: GridTileBar(
          leading: Icon(Icons.location_on, color: Colors.pink),
          title: Align(
            alignment: Alignment(-1.2, 0),
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  Text(
                    location!,
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
