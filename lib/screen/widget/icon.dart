import 'package:flutter/material.dart';

class Ricon extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final GestureTapCallback? onTap;
  final Color? color;

  const Ricon({Key? key, this.icon, this.onTap, this.size = 22, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: double.parse(size.toString()),
        color: color ?? Theme.of(context).iconTheme.color,
      ),
    );
  }
}
