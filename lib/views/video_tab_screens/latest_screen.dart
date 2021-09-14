import 'package:flutter/material.dart';
import 'package:luana_chat_app/models/livestream_item.dart';
import 'package:luana_chat_app/models/profile_item.dart';
import 'package:luana_chat_app/utils/color_const.dart';
import 'package:luana_chat_app/widgets/profile_item_widget.dart';

class LatestScreen extends StatelessWidget {
  LatestScreen({Key? key}) : super(key: key);

  final List<LivestreamItem> loadedProfiles = [
    LivestreamItem(
      id: '1',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
      viewers: '1.2k',
      active: true,
    ),
    LivestreamItem(
      id: '2',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
      viewers: '1.1k',
      active: true,
    ),
    LivestreamItem(
      id: '3',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
      viewers: '292',
      active: false,
    ),
    LivestreamItem(
      id: '4',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
      viewers: '144',
      active: false,
    ),
    LivestreamItem(
      id: '5',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
      viewers: '11.2k',
      active: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (ctx, i) => LiveStreamItemWidget(
                      id: loadedProfiles[i].id,
                      name: loadedProfiles[i].name,
                      location: loadedProfiles[i].location,
                      imageUrl: loadedProfiles[i].imageUrl),
                  itemCount: loadedProfiles.length,
                ),
              ),
            ),
          ],
        ));
  }
}

class LiveStreamItemWidget extends StatelessWidget {
  LiveStreamItemWidget(
      {Key? key,
      this.id,
      this.name,
      this.location,
      this.imageUrl,
      this.viewers,
      this.active})
      : super(key: key);

  final String? id;
  final String? name;
  final String? location;
  final String? imageUrl;
  final String? viewers;
  final bool? active;

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
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          margin: const EdgeInsets.only(left: 115),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text(
                viewers?.toString() ?? '1.2k',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: active ?? true ? Colors.green : Colors.red,
                ),
              ),
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
