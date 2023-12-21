import 'package:flutter/material.dart';
import 'package:movie_app/MovieList/movies.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:movie_app/UI/MovieUI/MovieUI.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({super.key});
  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {

  final List<Movies> movieList = Movies.getMovies();

  // final List movies = [
  //   "Titanic",
  //   "Blade Runner",
  //   "Rambo",
  //   "The Avengers",
  //   "Avatar",
  //   "I Am Legend",
  //   "300",
  //   "The Wolf of Wall Street",
  //   "Interstellar",
  //   "Game of Thrones",
  //   "Vikings",
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade100,
                ]
            )
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 15.0),
            child: Text("Movie App",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade200,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index){
            return Stack(
                children: [
                  Positioned(
                      child: movieCard(movieList[index], context)
                  ),
                  Positioned(
                      top: 4.0,
                      left: 5.0,
                      bottom: 4.0,
                      child: movieImage(movieList[index], context)
                  ),
                ],
            );
        // return Padding(
        //   padding: const EdgeInsets.all(3.0),
        //   child: Card(
        //     elevation: 3.5,
        //     color: Colors.white,
        //     child: ListTile(
        //       leading: CircleAvatar(
        //         child: Container(
        //           width: 400,
        //           height: 600,
        //           decoration: BoxDecoration(
        //             image: DecorationImage(
        //               image: AssetImage("${MovieList[index].Poster}"),
        //               fit: BoxFit.cover
        //             ),
        //             borderRadius: BorderRadius.circular(5.0)
        //           ),
        //           child: Text(""),
        //         ),
        //       ),
        //       trailing: Text("..."),
        //       title: Text("${MovieList[index].Title}", style: TextStyle(fontSize: 20, color: Colors.green.shade900),),
        //       subtitle: Padding(
        //         padding: const EdgeInsets.all(4.0),
        //         child: Text("${MovieList[index].Released}"),
        //       ),
        //       onTap:(){
        //         Navigator.push(context, MaterialPageRoute(
        //             builder: (context) => MovieListView(
        //               movieName: MovieList.elementAt(index).Title,
        //             movie: MovieList[index],)
        //         )
        //         );
        //       },
        //     )
        //   ),
        // );
      })
    );
  }
  Widget movieCard (Movies movies, BuildContext context) {
    return InkWell(
        child: Container(
          margin: const EdgeInsets.only(left: 50),
          width: MediaQuery.of(context).size.width,
          height: 90.0,
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 3.0, bottom: 3.0, left: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Flexible(
                          child: Text(movies.Title, style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),   //Movie_Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Rating : ${movies.imdbRating} / 10"),
                      ),
                      Text("Rated : ${movies.Rated}")
                    ],
                  ),   //Movie_Rating_&_Rated
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("Released Date :  ${movies.Released} "),
                      ),
                      Text(movies.Runtime),
                      // Text(movies.Rated)
                    ],
                  ),   //Movie_Released_Date_&_Run_Time
                ],
              ),
            ),
          ),
        ),
        onTap: () =>
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MovieListView(movieName: movies.Title, movie: movies))
          )
        }
    );
  }
  Widget movieImage(Movies movies, BuildContext context){
    return InkWell(
      child: FullScreenWidget(
        disposeLevel: DisposeLevel.Medium,
        child: Hero(
          tag: "smallImage",
          child: ClipRRect(
            child: Container(
              width: 80.0,
              height: 90.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(movies.Poster),
                      fit: BoxFit.cover
                )
              ),
            ),
          ),
        ),
      ),
    );
  }  //widget_for_Poster_on_home_screen
}   //Movie_Home_Screen/Route

class MovieListView extends StatelessWidget {

  final String movieName;
  final Movies movie;
  const MovieListView({super.key, required this.movieName, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Movies"),
      backgroundColor: Colors.blue.shade600,
      ),
      body: ListView(
        children: [
          MovieDetailThumnail(thumbnail: movie.Images[0]),  //Line-237
          MovieDetailsHeaderWithPoser(movie: movie),    //Line-277
          const HorizontalLine(),
          MovieDetilsCast(movie: movie),    //Line-385
          const HorizontalLine(), //Line-438
          MovieExtraPosters1(posters: movie.Images[1].toString()),
          MovieExtraPosters2(posters: movie.Images[2].toString()),
          MovieExtraPosters3(posters: movie.Images[3].toString()),
        ],
      ),
    );
  }
}   //Movie_Details_Screen/Route









