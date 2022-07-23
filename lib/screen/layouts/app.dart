import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kurdsubtitle/screen/widget/photo.dart';
import '../widget/icon.dart';

class Layout extends StatelessWidget {
  final Widget? child;
  const Layout({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Photo(
            url: 'assets/img/logo.svg',
            radius: 0,
            isLocal: true,
            fit: BoxFit.contain,
            width: 30,
            height: 30,
          ),
          actions: [
            Ricon(
              icon: FeatherIcons.search,
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: child,
        ),
      ),
    );
  }
}
