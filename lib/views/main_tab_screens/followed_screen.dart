import 'package:flutter/material.dart';
import 'package:luana_chat_app/models/profile_item.dart';
import 'package:luana_chat_app/widgets/profile_item_widget.dart';

class FollowedScreen extends StatelessWidget {
  FollowedScreen({Key? key}) : super(key: key);

  final List<ProfileItem> loadedProfiles = [
    ProfileItem(
      id: '1',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
    ),
    ProfileItem(
      id: '2',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
    ),
    ProfileItem(
      id: '3',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
    ),
    ProfileItem(
      id: '4',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
    ),
    ProfileItem(
      id: '5',
      name: 'John Doe',
      location: 'USA',
      imageUrl:
          'https://i.pinimg.com/564x/6f/de/85/6fde85b86c86526af5e99ce85f57432e.jpg',
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
                  itemBuilder: (ctx, i) => ProfileItemWidget(
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
