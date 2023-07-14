import 'package:flutter/material.dart';
import 'package:movie_app/views/pages/explorepage.dart';
import 'package:movie_app/views/pages/favoritepage.dart';
import 'package:movie_app/views/pages/homepage.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String accountName = "Bernard";
  String accountEmail = "bernard.realino98@gmail.com";
  String accountPicture = "assets/images/profile_image.jpeg";
  String backgroundPicture = "assets/images/profile_background.jpg";
  int selectedIndex = 1;

  List<Widget> views = [
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
              leading: Icon(Icons.movie),
              title: Text("Movies"),
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.youtube_searched_for_rounded),
              title: Text("Youtube"),
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
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
      body: views.elementAt(selectedIndex),
    );
  }
}
