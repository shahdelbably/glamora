import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomDropDownBilling extends StatefulWidget {
  const CustomDropDownBilling(
      {super.key,
      required this.listName,
      required this.formName,
      required this.hintText,
      required this.onChanged}); // إضافة onChanged هنا
  final List<String> listName;
  final String formName;
  final String hintText;
  final Function(String?) onChanged; // تعريف الخاصية

  @override
  State<CustomDropDownBilling> createState() => _CustomDropDownBillingState();
}

class _CustomDropDownBillingState extends State<CustomDropDownBilling> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.formName,
              style: Styles.textStyle16(context).copyWith(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            DropdownButtonFormField<String>(
              initialValue: selected,
              items: widget.listName.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: Styles.textStyle14(context).copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selected = value;
                });
                widget
                    .onChanged(value); // عند التغيير، نمرر القيمة لـ onChanged
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'field is required';
                }
                return null;
              },
              style: Styles.textStyle14(context),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 8),
                hintText: widget.hintText,
                hintStyle: Styles.textStyle14(context).copyWith(
                  color: const Color(0xff92929D),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey
                        : Colors.black,
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  borderSide: BorderSide(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                filled: true,
                fillColor: Colors.transparent,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:store_powered_ai/core/utils/styles.dart';

// class CustomDropDownBilling extends StatefulWidget {
//   const CustomDropDownBilling(
//       {super.key,
//       required this.listName,
//       required this.formName,
//       required this.hintText});
//   final List<String> listName;
//   final String formName;
//   final String hintText;
//   @override
//   State<CustomDropDownBilling> createState() => _CustomDropDownBillingState();
// }

// class _CustomDropDownBillingState extends State<CustomDropDownBilling> {
//   String? selected;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.only(
//           left: 16,
//           right: 15,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.formName,
//               style: Styles.textStyle16.copyWith(
//                 fontWeight: FontWeight.w400,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(
//               height: 8,
//             ),
//             DropdownButtonFormField<String>(
//               value: selected,
//               items: widget.listName.map((String item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: Styles.textStyle14.copyWith(
//                       color: Colors.black,
//                     ),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selected = value;
//                 });
//               },
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'field is required';
//                 }
//                 return null;
//               },
//               style: Styles.textStyle14,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.only(
//                   left: 8,
//                 ),
//                 hintText: widget.hintText,
//                 hintStyle: Styles.textStyle14.copyWith(
//                   color: const Color(0xff92929D),
//                 ),
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(6),
//                   ),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(6),
//                   ),
//                   borderSide: BorderSide(
//                     color: Color(0xffD7D4D8),
//                   ),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(6),
//                   ),
//                   borderSide: BorderSide(color: Colors.black),
//                 ),
//                 filled: true,
//                 fillColor: Colors.transparent,
//               ),
//               icon: const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.grey,
//                 size: 24,
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//           ],
//         ));
//   }
// }
