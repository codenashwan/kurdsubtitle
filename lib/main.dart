import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'Provider/home.dart';
import 'screen/home.dart';

void main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  String api = dotenv.env['API'].toString();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xff060F2F),
      systemNavigationBarColor: Color(0xff060F2F),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeApi(api)),
      ],
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowIndicator();
          return false;
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
            fontFamily: "Rabar",
            backgroundColor: Color(0xff1B2240),
            primaryColor: Color(0xff4BC9F0),
            scaffoldBackgroundColor: Color(0xff060F2F),
            hintColor: Colors.white60,
            focusColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.white),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Color(0xff1B2240),
            ),
          ),
          textDirection: TextDirection.rtl,
          initialRoute: "/",
          getPages: [
            GetPage(
              name: '/',
              page: () => Home(),
              transition: Transition.fadeIn,
            ),
          ],
        ),
      ),
    ),
  );
}
