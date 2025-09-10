import 'package:flutter/material.dart';

class BuildDropDown extends StatefulWidget {
  const BuildDropDown({
    super.key,
    required this.gender,
    required this.onChanged,
  });

  final String gender;
  final ValueChanged<String> onChanged;

  @override
  State<BuildDropDown> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BuildDropDown> {
  final List<String> genders = ["male", "female"];
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = genders.contains(widget.gender) ? widget.gender : '';
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DropdownButtonFormField<String>(
      initialValue: selectedGender,
      items: genders.map((String gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(
            gender,
            style: TextStyle(
              color: isDarkMode
                  ? Colors.white
                  : Colors.grey, // تغيير النص وفقًا للوضع
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value!;
        });
        widget.onChanged(value!); // استدعاء الدالة الممررة لتحديث القيمة
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: isDarkMode
                  ? Colors.white
                  : Colors.grey), // تغيير لون الحدود وفقًا للوضع
        ),
        filled: true,
        fillColor: Colors.transparent, // تغيير لون الخلفية
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: isDarkMode
                  ? Colors.white
                  : Colors.grey), // تغيير لون الحدود وفقًا للوضع
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: isDarkMode ? Colors.white : Colors.black, // تغيير لون الأيقونة
        size: 24,
      ),
    );
  }
}
