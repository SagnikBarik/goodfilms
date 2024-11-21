import 'package:flutter/cupertino.dart';
import 'package:goodfilms/screens/details_screen.dart';
import 'package:goodfilms/services/constants.dart';

class MovieSlider extends StatelessWidget {
  final AsyncSnapshot snapshot;

  const MovieSlider({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) { 
                    return DetailsScreen(movie: snapshot.data[index]);
                  },
                ),
              );
            },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    height: 202,
                    width: 133,
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data[index].posterPath}',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high ,
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
