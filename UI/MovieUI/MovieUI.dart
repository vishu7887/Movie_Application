import 'package:flutter/material.dart';
import 'package:movie_app/MovieList/movies.dart';

class MovieDetailThumnail extends StatelessWidget {

  final String thumbnail;

  const MovieDetailThumnail({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width, height: 250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(thumbnail), fit: BoxFit.cover
                      )
                  )
              ),
              const Padding(
                padding: EdgeInsets.only(top: 70.0, left: 140),
                child: Icon(Icons.play_arrow, size: 100, color: Colors.white,),
              )
            ]
        ),
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          height: 100,
        )
      ],
    );
  }
}    // Movie_Banner_with_Play_Button

class MovieDetailsHeaderWithPoser extends StatelessWidget {

  final Movies movie;
  const MovieDetailsHeaderWithPoser({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster : movie.Poster.toString()),  //Movie_Poster
          const SizedBox(width: 16),
          Expanded(
              child: MovieDetailsHeader(movie:movie)
          )
          // Flexible(
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 90.0, left: 10.0),
          //     child: Text(movie.Title,
          //       style: TextStyle(
          //         fontSize: 30,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ), //Movie_Title
        ],
      ),
    );
  }
}    // Movie_Poaster_&_Details

class MovieDetailsHeader extends StatelessWidget {

  final Movies movie;
  const MovieDetailsHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Text(movie.Title,
            style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),   //Title
          Text("${movie.Year}, ${movie.Genre}\n".toUpperCase(),
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent
            ),
          ),   //Year_and_Genre
          Text.rich(
              TextSpan(
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12
                  ),
                  children: [
                    TextSpan(
                        text: "${movie.Plot} "
                    ),
                    const TextSpan(
                        text: "More..",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue
                        )
                    ),
                  ]
              )
          )   //Polt
        ]
    );
  }
}   //sub-class_for_Movie_Poster_and_Details_Plots

class MoviePoster extends StatelessWidget {

  final String poster;
  const MoviePoster({super.key, required this.poster});
  get borderRadius => const BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(poster),
                fit: BoxFit.cover,
              )
          ),
        ),
      ),
    );
  }
}   //sub-class_for_Movie_Poster

class MovieDetilsCast extends StatelessWidget {

  final Movies movie;
  const MovieDetilsCast({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.Actors),
          MovieField(field: "Directors", value: movie.Director),
          MovieField(field: "Awards", value: movie.Awards),
        ],
      ),
    );
  }
}   // Movie_Cast

class MovieField extends StatelessWidget {

  final String field;
  final String value;
  const MovieField({super.key, required this.field, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$field : ",
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Colors.black54
            ),
          ),
          Expanded(
            child: Text(value,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black
              ),
            ),
          )
        ],
      ),
    );
  }
}    //sub-class_for_Movie_Cast

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}   //Horizontal_Line

class MovieExtraPosters1 extends StatelessWidget {

  const MovieExtraPosters1({super.key, required this.posters});
  final String posters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text("More Movie Posters...".toUpperCase(),
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 10, right: 12.0),
          child: SizedBox(
            height: 200,
            child: ListView.separated( scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: 1,
              itemBuilder: (context, index) =>
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: MediaQuery.of(context).size.width/ 1.07,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(posters),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        )
      ],
    );
  }
}    //Bottom_Movie_Poster_1

class MovieExtraPosters2 extends StatelessWidget {

  const MovieExtraPosters2({super.key, required this.posters});
  final String posters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 10, right: 12.0),
          child: SizedBox(
            height: 200,
            child: ListView.separated( scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: 1,
              itemBuilder: (context, index) =>
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.07,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(posters),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        )
      ],
    );
  }
}    //Bottom_Movie_Poster_2

class MovieExtraPosters3 extends StatelessWidget {

  const MovieExtraPosters3({super.key, required this.posters});
  final String posters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 10, right: 12.0, bottom: 10),
          child: SizedBox(
            height: 200,
            child: ListView.separated( scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: 1,
              itemBuilder: (context, index) =>
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.07,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage(posters),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            ),
          ),
        )
      ],
    );
  }
}    //Bottom_Movie_Poster_3