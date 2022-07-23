import 'package:flutter/material.dart';
import 'package:get/get.dart';

void error(message) {
  Get.snackbar(
    "error".tr,
    message,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(10),
    icon: Icon(Icons.error, color: Color(0xffF74E54)),
    colorText: Color(0xffF74E54),
  );
}

void info(message) {
  Get.snackbar(
    "info".tr,
    message,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(10),
    icon: Icon(Icons.info, color: Color(0xFFFFE600)),
    colorText: Color(0xFFFFE600),
  );
}

void success(message) {
  Get.snackbar(
    "success".tr,
    message,
    duration: Duration(seconds: 3),
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.all(10),
    icon: Icon(Icons.check, color: Color(0xFF00A156)),
    colorText: Color(0xFF00A156),
    backgroundColor: Colors.white,
  );
}
