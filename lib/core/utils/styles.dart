import 'package:flutter/material.dart';

const kFont = 'Poppins';

abstract class Styles {
  static TextStyle textStyle24(BuildContext context) {
    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle textStyle22(BuildContext context) {
    return TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle textStyle18(BuildContext context) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle textStyle12(BuildContext context) {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle textStyle10(BuildContext context) {
    return TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  static TextStyle textStyle8(BuildContext context) {
    return TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  static TextStyle textStyle9(BuildContext context) {
    return TextStyle(
      fontSize: 9,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodySmall?.color,
    );
  }

  static TextStyle textStyle11(BuildContext context) {
    return TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }

  static TextStyle textStyle15(BuildContext context) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle textStyle13(BuildContext context) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle textStyle17(BuildContext context) {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: kFont,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
  }
}
