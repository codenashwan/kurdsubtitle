import 'package:flutter/material.dart';

import 'text.dart';

class Lead extends StatelessWidget {
  final title;
  final IconData? icon;
  final GestureTapCallback? onTap;
  final bool? hideMore;

  const Lead({Key? key, this.title, this.onTap, this.icon, this.hideMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon == null
            ? SizedBox()
            : Container(
                padding: EdgeInsets.all(7),
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
                child: Icon(
                  icon,
                  size: 14,
                ),
              ),
        SizedBox(width: 10),
        Rtext(title, size: 20),
        Expanded(child: SizedBox()),
        hideMore == true
            ? SizedBox()
            : Rtext(
                "بینینی گشتی",
                size: 15,
                color: Theme.of(context).primaryColor,
                onTap: onTap,
              ),
      ],
    );
  }
}
