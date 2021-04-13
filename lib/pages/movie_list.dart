import 'package:flutter/material.dart';
import 'package:modulhttp/pages/movie_detail.dart';
import 'package:modulhttp/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;
  String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Popular Movies"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: GridView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          padding: const EdgeInsets.all(20),gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (context, int position) {
            return GridTile(
              child: InkResponse(
                enableFeedback: true,
                child: Image.network(
                  imgPath + movies[position].posterPath,
                  fit: BoxFit.cover,
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ),
            );
          }),
    );
  }
}