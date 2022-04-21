import 'package:flutter/material.dart';

import 'package:amaris_test/utils/const.dart';

class AmarisButton extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String text;
  final Function function;
  final bool disabled;
  const AmarisButton({
    Key? key,
    required this.backgroundColor,
    required this.fontColor,
    required this.text,
    required this.function,
    required this.disabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => function(),
      child: Text(text, style: TextStyle(color: fontColor)),
      style: ElevatedButton.styleFrom(
          primary: backgroundColor, shape: const StadiumBorder()),
    );
  }
}
