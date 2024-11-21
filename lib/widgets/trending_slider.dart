import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodfilms/screens/details_screen.dart';
import 'package:goodfilms/services/constants.dart';
import 'package:goodfilms/widgets/movie_carousel_layout.dart';

class TrendingSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.45,
          viewportFraction: 0.99999,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
        ),
        itemBuilder: (context, itemIndex, pageIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return DetailsScreen(movie: snapshot.data[itemIndex]);
                  },
                ),
              );
            },
            child: MovieCarouselLayout(
              posterUrl:
                  '${Constants.imagePath}${snapshot.data[itemIndex].backdropPath}',
              movieName: '${snapshot.data[itemIndex].originalTitle}',
            ),
          );
        },
      ),
    );
  }
}
