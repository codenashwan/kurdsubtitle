import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kurdsubtitle/screen/movie.dart';
import 'package:provider/provider.dart';

import '../../Provider/Movie.dart';
import '../widget/photo.dart';
import '../widget/text.dart';

class KCard extends StatelessWidget {
  final data;
  const KCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Movie(), transition: Transition.leftToRight);
        Provider.of<MovieApi>(context, listen: false).fetch(data['movieID']);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Photo(
                url: data['poster'],
                radius: 20,
                height: 150,
                width: 180,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Rtext(
                data['title'],
                size: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Rtext(
                data['genre']['name']['ku'],
                size: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
