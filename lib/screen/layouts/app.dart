import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:kurdsubtitle/screen/widget/photo.dart';
import 'package:kurdsubtitle/screen/widget/text.dart';
import '../widget/icon.dart';

class Layout extends StatelessWidget {
  final Widget? child;
  final String? title;
  final bool? isBack;
  const Layout({Key? key, this.child, this.isBack, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: isBack == true
              ? Rtext(
                  title,
                  size: 20,
                )
              : Photo(
                  url: 'assets/img/logo.svg',
                  radius: 0,
                  isLocal: true,
                  fit: BoxFit.contain,
                  width: 30,
                  height: 30,
                ),
          actions: isBack == true
              ? null
              : [
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
