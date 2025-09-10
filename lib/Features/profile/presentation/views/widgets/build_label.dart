  import 'package:flutter/material.dart';

Widget buildLabel(String text,FontWeight fontWeight) {

    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: fontWeight,fontFamily: 'Poppins'),
      ),
    );
  }
