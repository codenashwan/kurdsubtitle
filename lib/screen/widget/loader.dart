import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final size;
  const Loader({
    Key? key,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.parse(size.toString()),
      height: double.parse(size.toString()),
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
        strokeWidth: 1.5,
      ),
    );
  }
}
