import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kurdsubtitle/screen/components/review.dart';
import 'package:kurdsubtitle/screen/widget/photo.dart';
import 'package:provider/provider.dart';

import '../Provider/home.dart';
import 'components/card.dart';
import 'layouts/app.dart';
import 'widget/lead.dart';
import 'widget/loader.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Consumer<HomeApi>(
        builder: (context, value, child) {
          return value.load
              ? Center(child: Loader())
              : ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 150.0,
                        autoPlay: true,
                      ),
                      items: value.sliders.map((slide) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Photo(
                                url: slide['sliderImage'],
                                radius: 20,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Lead(
                      title: 'نوێترین فلیمەکان',
                      icon: FeatherIcons.film,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.movies.length,
                        itemBuilder: (context, index) {
                          return KCard(data: value.movies[index]);
                        },
                      ),
                    ),
                    Lead(
                      title: 'هەڵسەنگاندنەکان',
                      icon: Icons.star,
                    ),
                    SizedBox(
                      height: 240,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.reviews.length,
                        itemBuilder: (context, index) {
                          return KReview(data: value.reviews[index]);
                        },
                      ),
                    ),
                    Lead(
                      title: 'نوێترین زنجیرەکان',
                      icon: FeatherIcons.tv,
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.tvshows.length,
                        itemBuilder: (context, index) {
                          return KCard(data: value.tvshows[index]);
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
