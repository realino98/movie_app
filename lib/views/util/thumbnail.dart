import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  const Thumbnail({super.key, required this.title, required this.posterurl});
  final String title;
  final String posterurl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      //Posts
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(posterurl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Profile Picture
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    Text(title),
                  ],
                ),
                Icon(Icons.more_vert),
              ],
            ),
          ),
          //Caption
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username"),
                  Row(
                    children: [
                      Text("Views"),
                      Text("."),
                      Text("Upload Date"),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
