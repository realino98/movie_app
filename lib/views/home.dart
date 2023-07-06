import 'package:flutter/material.dart';
import 'package:movie_app/views/pages/explorepage.dart';
import 'package:movie_app/views/pages/favoritepage.dart';
import 'package:movie_app/views/pages/homepage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String accountName = "Bernard";
  String accountEmail = "hello.world@gmail.com";
  String accountPicture = "assets/images/profile_image.jpeg";
  String backgroundPicture = "assets/images/profile_background.jpg";
  int selectedIndex = 0;

  List<Widget> views = const [
    HomePage(),
    ExplorePage(),
    FavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(accountName),
              accountEmail: Text(accountEmail),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    accountPicture,
                    width: 90,
                    height: 90,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    backgroundPicture,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
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
                    Icon(
                      Icons.search,
                      color: Colors.grey[600],
                    ),
                    Text(
                      "Search for videos",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
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
            child: views.elementAt(selectedIndex),
          ),
        ],
      ),
    );
  }
}
