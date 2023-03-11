import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.ad_units)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              height: 80,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amo You JSquare',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  CircleAvatar(
                    radius: 15,
                  )
                ],
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Your Account'),
          ),
          const ListTile(
            leading: Icon(Icons.ondemand_video),
            title: Text('Your Orders'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Your Favourites'),
          ),
          const ListTile(
            leading: Icon(Icons.recommend_rounded),
            title: Text('Your Recommedations'),
          ),
          const ListTile(
            leading: Icon(Icons.transcribe_sharp),
            title: Text('Your Transactions'),
          ),
          const ListTile(
            leading: Icon(Icons.star),
            title: Text('Your Rating and Reviews'),
          ),
          const ListTile(
            leading: Icon(Icons.policy),
            title: Text('Term and Conditions'),
          ),
          const ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('Frequently Asked Questions'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
