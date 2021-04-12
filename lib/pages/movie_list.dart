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
 Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }
 @override
  void initState(){
    service = HttpService();
    //Tambahkan function initialize pada initState 
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
 body: ListView.builder(
        itemCount : (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies[position].title),
leading: Image.network('https://image.tmdb.org/t/p/w500/' +  movies[position].posterPath),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
  onTap: (){
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}