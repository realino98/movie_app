import 'package:flutter/material.dart';
import 'package:movie_app/views/pages/learnmorepage.dart';

class Thumbnail extends StatefulWidget {
  const Thumbnail(
      {super.key,
      required this.current_movie_index,
      required this.title,
      required this.overview,
      required this.posterurl});
  final String title, overview, posterurl;
  final int current_movie_index;

  @override
  State<Thumbnail> createState() => _ThumbnailState();
}

class _ThumbnailState extends State<Thumbnail> {
  double elevation = 2.0;
  double scale = 1.0;
  Offset translate = Offset(0, 0);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        print(value);
        if (value) {
          setState(() {
            elevation = 0;
            scale = 0.99;
            translate = Offset(0, 0);
            // print(elevation);
          });
        } else {
          setState(() {
            elevation = 0;
            scale = 1.0;
            // print(elevation);
            translate = Offset(0, 0);
          });
        }
      },
      child: Transform.translate(
        offset: translate,
        child: Transform.scale(
          scale: scale,
          child: Material(
            elevation: elevation,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => LearnMorePage(
                                movie_info: widget.current_movie_index),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Expanded(
                          child: Image.network(
                            widget.posterurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.overview,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 8),
                          Text(
                            '8.5',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
