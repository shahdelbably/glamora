import 'package:flutter/material.dart';

class Texts extends StatelessWidget {
  const Texts({
    super.key,
    required this.text,
    @required this.color,
    required this.fontsize,
    @required this.fontWeight
  });

 final String text;
 final Color? color ;
 final double fontsize;
 final FontWeight? fontWeight ;


  @override
  Widget build(BuildContext context) {
    return Text(
         text,
       style: TextStyle(
         color:color,
         fontSize: fontsize,
        // fontFamily: 'Poppins'
       ),
     );
  }
}