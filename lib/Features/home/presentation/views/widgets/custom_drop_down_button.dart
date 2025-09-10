import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class CustomDropDownButton extends StatefulWidget {
  final Function(String)? onChanged;
  const CustomDropDownButton({super.key, this.onChanged});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<String> items = [
    'Newest',
    'Oldest',
  ];
  String? selectedValue =
      'Newest'; // خلي بالك "Newest" مش "Newset" فيها غلط كتابي.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: Styles.textStyle10(context).copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff6E685F),
                        )),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
            widget.onChanged
                ?.call(value!); // هنا بنبعت القيمة اللي اختارها المستخدم
          },
          buttonStyleData: ButtonStyleData(
            width: 70,
            height: 25,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: const Color(0xffE9E6EA),
            ),
            elevation: 0,
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down,
                size: 14, color: Color(0xff7B7B7B)),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xffE9E6EA),
            ),
            offset: const Offset(-20, 0),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}

// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:store_powered_ai/core/utils/styles.dart';

// class CustomDropDownButton extends StatefulWidget {
//   const CustomDropDownButton({super.key, required this.onChanged});
//   final Function(String) onChanged;

//   @override
//   State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
// }

// class _CustomDropDownButtonState extends State<CustomDropDownButton> {
//   final List<String> items = [
//     'Newset',
//     'oldest',
//   ];
//   String? selectedValue = 'Newset';

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           items: items
//               .map((String item) => DropdownMenuItem<String>(
//                     value: item,
//                     child: Text(item,
//                         style: Styles.textStyle10.copyWith(
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0xff6E685F),
//                         )),
//                   ))
//               .toList(),
//           value: selectedValue,
//           onChanged: (String? value) {
//             setState(() {
//               selectedValue = value;
//               widget.onChanged(value!);
//             });
//           },
//           buttonStyleData: ButtonStyleData(
//             width: 70,
//             height: 25,
//             padding:
//                 const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               border: Border.all(
//                 color: Colors.transparent,
//               ),
//               color: const Color(0xffE9E6EA),
//             ),
//             elevation: 0,
//           ),
//           iconStyleData: const IconStyleData(
//             icon: Icon(
//               Icons.keyboard_arrow_down,
//             ),
//             iconSize: 14,
//             iconEnabledColor: Color(0xff7B7B7B),
//             iconDisabledColor: Color(0xff7B7B7B),
//           ),
//           dropdownStyleData: DropdownStyleData(
//             maxHeight: 200,
//             width: 80,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: const Color(0xffE9E6EA),
//             ),
//             offset: const Offset(-20, 0),
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             height: 40,
//             padding: EdgeInsets.only(left: 10, right: 10),
//           ),
//         ),
//       ),
//     );
//   }
// }
