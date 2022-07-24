import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:kurdsubtitle/screen/widget/icon.dart';
import 'package:kurdsubtitle/screen/widget/lead.dart';
import 'package:kurdsubtitle/screen/widget/photo.dart';
import 'package:kurdsubtitle/screen/widget/text.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Provider/Movie.dart';
import 'layouts/app.dart';
import 'widget/loader.dart';
import 'dart:io';

class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  late String url = "";
  late bool play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Consumer<MovieApi>(
        builder: (context, value, child) {
          return value.load
              ? Center(child: Loader())
              : ListView(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  children: [
                    SizedBox(
                      height: 450,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100),
                              ),
                            ),
                            child: Photo(
                              url: value.movie['poster'],
                              radius: 0,
                              height: 450,
                              width: double.infinity,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.9, -0.8),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Ricon(
                                    icon: FeatherIcons.arrowRight,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.9, 1.03),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  play = !play;
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.8),
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xff236FEE),
                                      Color(0xff8411EE),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Ricon(
                                    icon: play == false
                                        ? FeatherIcons.play
                                        : FeatherIcons.pause,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    play == false
                        ? SizedBox()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Lead(
                              title: "سێرڤەر دیاری بکە",
                              icon: FeatherIcons.server,
                              hideMore: true,
                            ),
                          ),
                    SizedBox(height: 10),
                    play == false
                        ? SizedBox()
                        : SizedBox(
                            height: 40,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (var i = 0;
                                    i < value.movie['watchServers'].length;
                                    i++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        url = value.movie['watchServers'][i]
                                            ['value'];
                                      });
                                    },
                                    child: Container(
                                      height: 40,
                                      // width: 70,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: url ==
                                                value.movie['watchServers'][i]
                                                    ['value']
                                            ? Colors.purple
                                            : Color(0xff363B49),
                                      ),
                                      child: Rtext(
                                        value.movie['watchServers'][i]['name'],
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                    play == false ? SizedBox() : SizedBox(height: 20),
                    play == false
                        ? SizedBox()
                        : Container(
                            height: 300,
                            color: Colors.white,
                            child: WebView(
                              initialUrl: url,
                              javascriptMode: JavascriptMode.unrestricted,
                            ),
                          ),
                    SizedBox(height: 5),
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(20),
                      shrinkWrap: true,
                      children: [
                        Rtext(
                          value.movie['year'],
                          size: 10,
                          color: Colors.grey,
                          textAlign: TextAlign.center,
                        ),
                        Rtext(
                          value.movie['title'],
                          size: 20,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                        Rtext(
                          value.movie['kurdish_title'],
                          size: 15,
                          color: Colors.grey,
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Rtext(
                              value.movie['ratings'][0]['Value'].toString(),
                              size: 15,
                              color: Colors.grey,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(width: 5),
                            Ricon(
                              icon: FeatherIcons.star,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0;
                                  i < value.movie['genres'].length;
                                  i++)
                                Container(
                                  height: 40,
                                  // width: 70,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xff363B49),
                                  ),
                                  child: Rtext(
                                    value.movie['genres'][i]['name']['ku'],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Rtext(
                          value.movie['plot'],
                          size: 15,
                          color: Colors.grey,
                          maxlines: 300,
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Lead(
                            title: "کاری تەکنیکی",
                            icon: FeatherIcons.umbrella,
                            hideMore: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 90,
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0;
                                  i < value.movie['technitions'].length;
                                  i++)
                                Column(
                                  children: [
                                    Photo(
                                      url: value.movie['technitions'][i]
                                          ['profile_pic'],
                                      width: 50,
                                      height: 50,
                                      radius: 100,
                                    ),
                                    SizedBox(height: 5),
                                    Rtext(
                                      value.movie['technitions'][i]['name'],
                                      size: 10,
                                      color: Colors.grey,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Lead(
                            title: "دیزاینی بەرگ",
                            icon: FeatherIcons.penTool,
                            hideMore: true,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 90,
                          child: ListView(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var i = 0;
                                  i < value.movie['designers'].length;
                                  i++)
                                Column(
                                  children: [
                                    Photo(
                                      url: value.movie['designers'][i]
                                          ['profile_pic'],
                                      width: 50,
                                      height: 50,
                                      radius: 100,
                                    ),
                                    SizedBox(height: 5),
                                    Rtext(
                                      value.movie['designers'][i]['name'],
                                      size: 10,
                                      color: Colors.grey,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
        },
      ),
    );
  }
}
