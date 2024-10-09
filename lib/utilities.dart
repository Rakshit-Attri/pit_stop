import 'package:flutter/material.dart';

Text myText(
  data, {
  required context,
  decoration,
  Key? key,
  bool softwrap = true,
  textColor,
  double? fontSize,
  fontWeight,
  double? height,
  bool isFirstCap = false,
  TextOverflow? overflow,
  TextAlign? textAlign,
  FontStyle? fontStyle,
  TextDirection? textDirection,
  int? maxLines,
}) {
  final Color = (textColor != null) ? textColor : Colors.black;
  return Text(
    data,
    key: key,
    softWrap: softwrap,
    //textScaleFactor: 1,
    textAlign: textAlign,
    style: TextStyle(
      fontStyle: fontStyle,
      color: Color,
      fontSize: fontSize,
      //  overflow: TextOverflow.ellipsis,
      fontWeight: fontWeight,
      height: height,
      fontFamily: "poppins",
      decoration: decoration,
    ),
    overflow: overflow,
    maxLines: maxLines,
  );
}
