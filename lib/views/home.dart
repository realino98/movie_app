import 'package:flutter/material.dart';
import 'package:movie_app/views/pages/explorepage.dart';
import 'package:movie_app/views/pages/favoritepage.dart';
import 'package:movie_app/views/pages/homepage.dart';
import 'package:movie_app/views/util/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Widget> views = const [
    HomePage(),
    ExplorePage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
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
            flex: 5,
            child: views[selectedIndex],
          ),
        ],
      ),
    );
  }
}
