import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomReviewContainer extends StatelessWidget {
  const CustomReviewContainer({super.key, required this.review});
  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    // 🧠 استخراج المسار من الداتا بيز
    final rawPath = review.user.avatarFile ?? '';
    String? cleanedPath;

    if (rawPath.startsWith('File:')) {
      cleanedPath =
          rawPath.replaceFirst('File: ', '').replaceAll("'", '').trim();
    }

    File? avatarFile;
    if (cleanedPath != null &&
        cleanedPath.isNotEmpty &&
        File(cleanedPath).existsSync()) {
      avatarFile = File(cleanedPath);
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff92929D),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: avatarFile != null
                ? FileImage(avatarFile)
                : const AssetImage('assets/images/placeholder.png')
                    as ImageProvider,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${review.user.firstName} ${review.user.lastName}',
                      style: Styles.textStyle11(context),
                    ),
                    const SizedBox(width: 3),
                    CustomRating(
                      size: 12,
                      rating: review.rating.toInt(),
                    ),
                    const Spacer(),
                    Text(
                      formatReviewDate(review.createdAt),
                      style: Styles.textStyle9(context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff7B7B7B),
                      ),
                    ),
                  ],
                ),
                ReadMoreText(
                  review.comment,
                  trimLines: 2,
                  style: Styles.textStyle8(context),
                  colorClickableText: Colors.black,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'See More',
                  trimExpandedText: 'See Less',
                  moreStyle: Styles.textStyle8(context).copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatReviewDate(String dateFromDatabase) {
    final DateTime reviewDate = DateTime.parse(dateFromDatabase).toLocal();
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(reviewDate);

    if (difference.inDays == 0) {
      if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else {
        return 'Just now';
      }
    } else if (difference.inDays <= 3) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else {
      return DateFormat('d MMMM yyyy').format(reviewDate);
    }
  }
}

// import 'dart:io';

// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:readmore/readmore.dart';
// import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
// import 'package:store_powered_ai/Features/profile/data/models/reviews_model.dart';
// import 'package:store_powered_ai/core/utils/styles.dart';

// class CustomReviewContainer extends StatelessWidget {
//   const CustomReviewContainer({super.key, required this.review});
//   final ReviewModel review;
//   @override
//   Widget build(BuildContext context) {
//     File? avatarFile;
//     avatarFile =
//         File(review.user.avatarFile!.split(": ").last.replaceAll("'", ""));
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: const Color(0xff92929D),
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 15,
//             backgroundImage: avatarFile != null
//                 ? FileImage(avatarFile!)
//                 : const AssetImage('assets/images/placeholder.png')
//                     as ImageProvider,
//           ),
//           const SizedBox(
//             width: 5,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       '${review.user.firstName} ${review.user.lastName}',
//                       style: Styles.textStyle11(context),
//                     ),
//                     const SizedBox(
//                       width: 3,
//                     ),
//                     CustomRating(
//                       size: 12,
//                       rating: review.rating.toInt(),
//                     ),
//                     const Spacer(),
//                     Text(
//                       formatReviewDate(review.createdAt),
//                       style: Styles.textStyle9(context).copyWith(
//                         fontWeight: FontWeight.w500,
//                         color: const Color(0xff7B7B7B),
//                       ),
//                     )
//                   ],
//                 ),
//                 // Text(
//                 //   'Color: Black / Size: M',
//                 //   style: Styles.textStyle9(context).copyWith(
//                 //     fontWeight: FontWeight.w500,
//                 //     color: const Color(0xff7B7B7B),
//                 //   ),
//                 // ),
//                 ReadMoreText(
//                   review.comment,
//                   trimLines: 2,
//                   style: Styles.textStyle8(context).copyWith(),
//                   colorClickableText: Colors.black,
//                   trimMode: TrimMode.Line,
//                   trimCollapsedText: 'See More',
//                   trimExpandedText: 'see Less',
//                   moreStyle: Styles.textStyle8(context).copyWith(
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   String formatReviewDate(String dateFromDatabase) {
//     final DateTime reviewDate = DateTime.parse(dateFromDatabase).toLocal();
//     final DateTime now = DateTime.now();

//     final Duration difference = now.difference(reviewDate);

//     if (difference.inDays == 0) {
//       if (difference.inHours > 0) {
//         return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
//       } else if (difference.inMinutes > 0) {
//         return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
//       } else {
//         return 'Just now';
//       }
//     } else if (difference.inDays <= 3) {
//       return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
//     } else {
//       return DateFormat(
//         'd MMMM yyyy',
//       ).format(reviewDate);
//     }
//   }
// }
