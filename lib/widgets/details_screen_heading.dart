import 'package:flutter/material.dart';
import 'package:goodfilms/models/movie.dart';
import 'package:goodfilms/models/movie_details.dart';
import 'package:goodfilms/services/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsScreenHeading extends StatelessWidget {
  final MovieDetails movieDetails;

  const DetailsScreenHeading({
    super.key,
    required this.movie,
    required this.movieDetails,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    String dateString = movie.releaseDate;
    DateTime date = DateTime.parse(dateString);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network('${Constants.imagePath}${movie.backdropPath}',
                fit: BoxFit.cover, filterQuality: FilterQuality.high),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Color.fromARGB(200, 30, 40, 48),
                  Color.fromARGB(255, 30, 40, 48),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 215,
                        alignment: Alignment.bottomCenter,
                        child: Image.network(
                            '${Constants.imagePath}${movie.posterPath}',
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high),

                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.originalTitle,
                            style: GoogleFonts.rubik(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                date.year.toString(),
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                                child: Icon(
                                  Icons.circle,
                                  size: 5,
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                '${movieDetails.runtime ~/ 60}h ${(movieDetails.runtime % 60).toInt()}m',
                                style: GoogleFonts.rubik(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            constraints: BoxConstraints.tight(
                              const Size(70, 25),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white12,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  movie.voteAverage.toStringAsFixed(2),
                                  style: GoogleFonts.rubik(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
