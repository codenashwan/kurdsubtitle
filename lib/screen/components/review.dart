import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widget/icon.dart';
import '../widget/photo.dart';
import '../widget/text.dart';

class KReview extends StatelessWidget {
  final data;
  const KReview({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff236FEE),
            Color(0xff8411EE),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Ricon(
                  icon: FeatherIcons.user,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Rtext(
                    data['owner']['name'].toString(),
                  ),
                  Rtext(
                    "ئەندام",
                    size: 10,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          RatingBarIndicator(
            rating: double.parse(data['rating'].toString()),
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.white,
            ),
            itemCount: 5,
            itemSize: 25.0,
          ),
          Rtext("بۆ ${data['item']['title']}"),
          SizedBox(height: 5),
          Rtext(
            data['review'],
            maxlines: 3,
          )
        ],
      ),
    );
  }
}
