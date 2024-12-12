import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mob_app/models/movie.dart';

class MovieWidget extends StatefulWidget {
  const MovieWidget({super.key});

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  final movies = [
    Movie(
      imageName: 'images/IMG_8357.png',
      title: 'Title 1',
      time: '11/08/1982',
      description:
          'desdfs efs  dfsdfasfasdasf sadfasesdfs efs  dfsdfasfasdasf sadfa esdfs efs  dfsdfasfasdasf sadfa',
    ),
    Movie(
      imageName: 'images/IMG_8357.png',
      title: 'ho',
      time: '11/08/1985',
      description:
          'desdfs efs  dfsdfasfasdasf sadfasesdfs efs  dfsdfasfasdasf sadfa esdfs efs  dfsdfasfasdasf sadfa',
    ),
  ];

  final textEditingController = TextEditingController();
  var filteredMovies = <Movie>[];

  void search() {
    final query = textEditingController.text;
    if (query.isNotEmpty) {
      filteredMovies = movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredMovies = movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    filteredMovies = movies;
    textEditingController.addListener(search);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          itemCount: filteredMovies.length,
          itemExtent: 163,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (BuildContext context, int index) {
            final movie = filteredMovies[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.black.withOpacity(0.3), width: 1),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 5,
                        )
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage(movie.imageName)),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  movie.time,
                                  style: TextStyle(fontSize: 10),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      onTap: () {
                        print('tap item');
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              label: Text('Search'),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
