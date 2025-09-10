import 'package:flutter/material.dart';

class ReviewTextField extends StatelessWidget {
  final TextEditingController controller;

  const ReviewTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
      cursorColor: isDark ? Colors.white : Colors.black,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: isDark ? Colors.white : Colors.black,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        hintText: 'Enter here',
        hintStyle: const TextStyle(
          color: Color(0xff92929D),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter a review';
        }
        return null;
      },
      maxLines: null,
      expands: true,
      textAlignVertical: TextAlignVertical.top,
    );
  }
}

// import 'package:flutter/material.dart';

// class ReviewTextField extends StatelessWidget {
//   final TextEditingController controller;

//   const ReviewTextField({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       decoration: const InputDecoration(
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black, width: 1.5)),
//         enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey, width: 1.5)),
//         hintText: 'Enter here',
//         hintStyle: TextStyle(color: Colors.grey),
//         border: OutlineInputBorder(),
//       ),
//       validator: (value) {
//         if (value == null || value.trim().isEmpty) {
//           return 'Please enter a review';
//         }
//         return null;
//       },
//       maxLines: null,
//       expands: true,
//       textAlignVertical: TextAlignVertical.top,
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ReviewTextField extends StatelessWidget {
//   const ReviewTextField({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration: const InputDecoration(
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black,width: 1.5)
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey,width: 1.5)
//         ),
//         hintText: 'Enter here',
//         hintStyle: TextStyle(
//           color: Colors.grey
//         ),
//         border: OutlineInputBorder(),
//       ),
//       maxLines: null, 
//       expands: true,
//       textAlignVertical: TextAlignVertical.top, 
//     );
//   }
// }