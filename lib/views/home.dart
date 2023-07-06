import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> views = const [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Explore'),
    ),
    Center(
      child: Text('Favorite'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Title
            Text(
              "Movies",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //Search
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.grey[300],
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Text("Search for videos"),
                  ],
                ),
              ),
            ),
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.notifications),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(Icons.menu),
                ),
                Icon(Icons.person),
              ],
            )
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[100],
              //Buttons
              child: ListView(
                children: [
                  ListTile(
                    trailing: Icon(Icons.arrow_left),
                  ),
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text("Dashboard"),
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.explore),
                    title: Text("Explore"),
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text("Favorite"),
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: views.elementAt(selectedIndex),
          ),
        ],
      ),
    );
  }
}
