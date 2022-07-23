import 'package:flutter/material.dart';

import 'icon.dart';

class Input extends StatelessWidget {
  final TextEditingController textController;
  final String hint;
  final IconData? icon;
  final Function(String)? onChanged;
  final EdgeInsets padding;
  final TextInputType keyboardType;
  final int topPadding;
  final FocusNode? focusNode;
  const Input({
    Key? key,
    required this.textController,
    this.hint = "Search",
    this.icon,
    this.onChanged,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.keyboardType = TextInputType.text,
    this.topPadding = 20,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      focusNode: focusNode,
      controller: textController,
      keyboardType: keyboardType,
      maxLines: keyboardType == TextInputType.multiline ? 6 : 1,
      obscureText: keyboardType == TextInputType.visiblePassword ? true : false,
      decoration: InputDecoration(
        prefixIcon: keyboardType == TextInputType.multiline
            ? null
            : (icon == null
                ? null
                : Ricon(
                    icon: icon,
                    size: 20,
                  )),
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
          color: Theme.of(context).hintColor,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF4F4F4),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffF4F4F4),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: EdgeInsetsDirectional.fromSTEB(
            20, double.parse(topPadding.toString()), 0, 20),
      ),
      style: TextStyle(
        fontFamily: Theme.of(context).textTheme.bodyText1?.fontFamily,
        color: Theme.of(context).focusColor,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
