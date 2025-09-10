// import 'package:flutter/material.dart';
// import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_button_review.dart';
// import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_rating.dart';
// import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_text_form_field.dart';
// import 'package:store_powered_ai/core/utils/styles.dart';

// class CustomLeaveReview extends StatefulWidget {
//   const CustomLeaveReview({super.key});

//   @override
//   State<CustomLeaveReview> createState() => _CustomLeaveReviewState();
// }

// GlobalKey<FormState> formKey = GlobalKey();

// class _CustomLeaveReviewState extends State<CustomLeaveReview> {
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: formKey,
//       child: Container(
//         padding: const EdgeInsets.only(
//           top: 16,
//           bottom: 29,
//           right: 12,
//           left: 12,
//         ),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: const Color(0xff92929D))),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Submit Your Review',
//               style: Styles.textStyle14.copyWith(
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             const Text(
//               'Add Your Rating *',
//               style: Styles.textStyle12,
//             ),
//             const SizedBox(
//               height: 4,
//             ),
//             const CustomRating(
//               size: 12,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Text(
//               'Product Details',
//               style: Styles.textStyle14.copyWith(
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(
//               height: 14,
//             ),
//             CustomTextFormField(
//               formName: 'Color *',
//               hintText: 'Ex. Black',
//               onChanged: (data) {},
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomTextFormField(
//               formName: 'Size *',
//               hintText: 'Ex. L',
//               onChanged: (data) {},
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             CustomTextFormField(
//               formName: 'Write Your Review *',
//               hintText: 'Write here......',
//               maxLines: 5,
//               onChanged: (data) {},
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             CustomButtonReview(
//               onPressed: () {
//                 if (formKey.currentState!.validate()) {
//                 } else {}
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
