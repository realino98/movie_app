import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final String id;

  VideoScreen({required this.id});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    onReady: () {
                      print('Player is ready.');
                    },
                  ),
                  Text(
                    widget.id,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 24.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Username"),
                                    Icon(
                                      Icons.verified,
                                    ),
                                  ],
                                ),
                                Text("2400 Subscribers"),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.notifications),
                                Text("Subscribe"),
                                Icon(Icons.arrow_downward),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.thumb_up),
                                Text("124K"),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.thumb_down),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Icon(Icons.share),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 160,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text("Username"),
                                Text("Views . Uploaded"),
                              ],
                            ),
                          ],
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
