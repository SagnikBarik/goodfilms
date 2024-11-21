import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCarouselLayout extends StatelessWidget {
  final String posterUrl;
  final String movieName;
  const MovieCarouselLayout({
    super.key,
    required this.posterUrl,
    required this.movieName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: double.infinity,
          child: Image.network(
            posterUrl,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.transparent,
                Color.fromARGB(255, 30, 40, 48),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Text(
            movieName,
            style: GoogleFonts.rubik(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
