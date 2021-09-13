import 'package:flutter/material.dart';

class BeautySettings extends StatelessWidget {
  const BeautySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Image.network(
              'https://storage.needpix.com/rsynced_images/girl-face-3789933_1280.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Spacer(),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    'Skin',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Style',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'BeautyFilter',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
