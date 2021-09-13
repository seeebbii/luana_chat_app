import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final List<Color> colors = [
    Colors.pink,
    Colors.purple,
    Colors.orange,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white30),
            child: TextField(
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10)),
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 9, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.pink,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Icon(Icons.search),
              ),
            )
          ],
          bottom: PreferredSize(
            child: Container(
              color: Colors.pink.withOpacity(0.4),
              height: 1,
            ),
            preferredSize: Size.fromHeight(1),
          ),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text('Search Country'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      countryTile('Pakistan'),
                      countryTile('Afghanistan'),
                      countryTile('USA'),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        countryTile('India'),
                        countryTile('China'),
                        countryTile('Bangladesh'),
                      ]),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  'Hot',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < 3; i++)
                  Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Image.network(
                      'https://www.thenews.com.pk/assets/uploads/updates/2021-02-14/790057_3145524_Pwari-ho-rai-hai-girl_updates.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            )
          ],
        ));
  }

  Container countryTile(String title) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (colors.toList()..shuffle()).first),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(title),
      ),
    );
  }
}
