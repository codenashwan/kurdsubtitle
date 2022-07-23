import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeApi extends GetConnect with ChangeNotifier {
  String api;
  HomeApi(this.api) {
    fetchHome();
  }
  final storage = GetStorage();
  late List<dynamic> sliders = [];
  late List<dynamic> movies = [];
  late List<dynamic> tvshows = [];
  late List<dynamic> reviews = [];

  bool load = false;

  void toggleLoading() {
    load = !load;
    notifyListeners();
  }

  void fetchHome() async {
    toggleLoading();
    var response = await get(
      "${api}home",
    );
    sliders = response.body['data']['sliders'];
    movies = response.body['data']['movies'];
    tvshows = response.body['data']['tvshows'];
    reviews = response.body['data']['reviews'];
    toggleLoading();
  }
}
