// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/data/models/user_model.dart';
import 'package:store_powered_ai/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/build_drop_down.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/edit_userprofile_pic.dart';

class EditProfilebody extends StatefulWidget {
  EditProfilebody(
    this.selectedGender, {
    super.key,
    required this.fName,
    required this.lName,
    required this.email,
    required this.address,
  });

  final String fName;
  final String lName;
  final String email;
  final String address;
  String selectedGender = 'female';

  @override
  EditProfileBodyState createState() => EditProfileBodyState();
}

class EditProfileBodyState extends State<EditProfilebody> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  List<Widget> addressFields = [];
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            buildLabel("First Name", FontWeight.w500),
            buildTextField(firstNameController, hint: widget.fName),
            buildLabel("Last Name", FontWeight.w500),
            buildTextField(lastNameController, hint: widget.lName),
            buildLabel("Email", FontWeight.w500),
            buildTextField(emailController,
                hint: widget.email, keyboardType: TextInputType.emailAddress),
            buildLabel("Address", FontWeight.w500),
            buildTextField(addressController,
                readOnly: true,
                hint: widget.address,
                keyboardType: TextInputType.streetAddress),
            // Column(children: [...addressFields]),
            //  buildAddButton("Add another address", onPressed: () {
            //   addTextField(addressFields, addressController, 'Stade, Tanta',
            //       TextInputType.streetAddress,);
            // }),
            buildLabel("Gender", FontWeight.w500),
            BuildDropDown(
              gender: widget.selectedGender,
              onChanged: (value) {
                setState(() {
                  widget.selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Center(
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.black,
            //       padding: const EdgeInsets.symmetric(
            //           vertical: 16.0, horizontal: 25.0),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //     ),
            //     onPressed: () async {
            //       final updatedData = {
            //         "firstName": firstNameController.text,
            //         "lastName": lastNameController.text,
            //         "email": emailController.text,
            //         "phone": phoneController.text,
            //         "addresses": addressFields.isEmpty
            //             ? addressController.text
            //             : addressFields.map((e) => e.toString()).toList(),
            //         "gender": widget.selectedGender,
            //         'avatarFile': EditUserprofilePic.imageFile != null
            //             ? EditUserprofilePic.imageFile
            //             : null
            //       };

            //       if (EditUserprofilePic.imageFile != null) {
            //         updatedData['avatarFile'] =
            //             EditUserprofilePic.imageFile as Object;
            //       }

            //       context
            //           .read<AuthCubit>()
            //           .updateUserProfile(updatedData: updatedData);
            //     },
            //     child: const Text(
            //       "Update Profile",
            //       style: TextStyle(fontSize: 16, color: Colors.white),
            //     ),
            //   ),
            // ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () async {
                  final imageFile = EditUserprofilePic.imageFile;
                  final currentUser = context
                      .read<AuthCubit>()
                      .userModel; // ← بيانات المستخدم الحالية

                  final Map<String, dynamic> updatedData = {
                    "firstName": firstNameController.text.isEmpty
                        ? currentUser?.firstName
                        : firstNameController.text,
                    "lastName": lastNameController.text.isEmpty
                        ? currentUser?.lastName
                        : lastNameController.text,
                    "email": emailController.text.isEmpty
                        ? currentUser?.email
                        : emailController.text,
                    // "phone": phoneController.text.isEmpty
                    // ? currentUser?.
                    // : phoneController.text,
                    "gender": widget.selectedGender.isEmpty
                        ? currentUser?.gender
                        : widget.selectedGender,
                    "addresses": addressFields.isEmpty
                        ? addressController.text
                        : addressFields.map((e) => e.toString()).toList(),
                  };

                  if (imageFile != null) {
                    updatedData["avatarFile"] = imageFile;
                  }

                  context
                      .read<AuthCubit>()
                      .updateUserProfile(updatedData: updatedData);
                },
                child: const Text(
                  "Update Profile",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text, FontWeight fontWeight) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: 16,
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
    );
  }

  // Widget buildTextField(TextEditingController controller,
  //     {String? hint,
  //      TextInputType keyboardType = TextInputType.text}) {
  //   final isDarkMode = Theme.of(context).brightness ==
  //       Brightness.dark;
  //       // التحقق من الوضع الحالي
  //   return TextFormField(
  //     controller: controller,
  //     keyboardType: keyboardType,
  //     style: TextStyle(
  //       color: isDarkMode
  //           ? Colors.white
  //           : Colors.black, // تغيير اللون بناءً على الوضع
  //     ),
  //     decoration: InputDecoration(
  //       hintText: hint,
  //       filled: true,
  //       fillColor: Colors.transparent, // الخلفية في الوضع الداكن والفاتح
  //       hintStyle: TextStyle(
  //         color:
  //             isDarkMode ? Colors.white60 : Colors.black45, // لون النص التلميحي
  //       ),
  //       contentPadding:
  //           const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //         borderSide: BorderSide(
  //             color: isDarkMode ? Colors.white30 : Colors.grey), // الحدود
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //         borderSide: BorderSide(
  //             color: isDarkMode
  //                 ? Colors.white
  //                 : Colors.black), // الحدود عند التركيز
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //         borderSide: BorderSide(
  //             color: isDarkMode
  //                 ? Colors.white30
  //                 : Colors.grey), // الحدود عند التمكين
  //       ),
  //     ),
  //   );
  // }
  Widget buildTextField(
    TextEditingController controller, {
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false, // باراميتر جديد مع قيمة افتراضية
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly, // استخدم الباراميتر هنا
      style: TextStyle(
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: TextStyle(
          color: isDarkMode ? Colors.white60 : Colors.black45,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              BorderSide(color: isDarkMode ? Colors.white30 : Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              BorderSide(color: isDarkMode ? Colors.white : Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
              BorderSide(color: isDarkMode ? Colors.white30 : Colors.grey),
        ),
      ),
    );
  }

  Widget buildAddButton(String text, {required VoidCallback onPressed}) {
    final isDarkMode = Theme.of(context).brightness ==
        Brightness.dark; // التحقق من الوضع الحالي

    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.add, color: isDarkMode ? Colors.white : Colors.black),
      label: Text(
        text,
        style: TextStyle(
            color: isDarkMode
                ? Colors.white
                : Colors.black), // لون النص بناءً على الوضع
      ),
    );
  }

  void addTextField(List<Widget> fields, TextEditingController controller,
      String hint, TextInputType keyboardType) {
    setState(() {
      fields.add(Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: buildTextField(TextEditingController(),
            hint: hint, keyboardType: keyboardType),
      ));
    });
  }
}
