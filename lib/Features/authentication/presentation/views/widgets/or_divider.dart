import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
        children: [
    Expanded(
     child: Divider(thickness: 1, color:Color(0xFF92929D)),
          ),
          Padding(
     padding:  EdgeInsets.symmetric(horizontal: 8.0),
     child: Text(
       'OR',
       style:  TextStyle(
          color: Color(0xFF92929D),
           fontSize: 14,
           fontFamily: 'Poppins',
           fontWeight: FontWeight.w500,
       ),
     ),
          ),
    Expanded(
     child: Divider(thickness: 1, color: Color(0xFF92929D)),
          ),
        ],
     );
  }
}

