import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  String accountName = "Bernard";
  String accountEmail = "hello.world@gmail.com";
  String accountPicture = "assets/images/profile_image.jpeg";
  String backgroundPicture = "assets/images/profile_background.jpg";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.grey[100],
        //Buttons
        child: Drawer(
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
                trailing: Icon(Icons.arrow_left),
              ),
              ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Dashboard"),
                onTap: () {
                  setState(() {
                    // selectedIndex = 0;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.explore),
                title: Text("Explore"),
                onTap: () {
                  setState(() {
                    // selectedIndex = 1;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text("Favorite"),
                onTap: () {
                  setState(() {
                    // selectedIndex = 2;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
