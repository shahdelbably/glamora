// container base for stack has a name of user then positioned on it circle avatar for user pic
import 'package:flutter/material.dart';

class ProfileNameContainer extends StatelessWidget {
  const ProfileNameContainer({
    super.key,
    required this.editUserPic,
    required this.fName,
    required this.lName,
  });

  final String fName, lName;
  final bool editUserPic;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 48),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: editUserPic == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    fName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const Text(' '),
                  Text(
                    lName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            : null);
  }
}
