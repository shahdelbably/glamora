import 'dart:io';
import 'package:flutter/material.dart';

class UserProfilePic extends StatelessWidget {
  const UserProfilePic({super.key, this.avatarFile, this.avatarUrl});

  final File? avatarFile;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;

    if (avatarFile != null && !avatarFile!.path.contains('avatarFile.jpg')) {
      imageProvider = FileImage(avatarFile!);
    } else if (avatarUrl != null &&
        avatarUrl!.isNotEmpty &&
        !avatarUrl!.contains('avatarFile.jpg')) {
      imageProvider = NetworkImage(avatarUrl!);
    } else {
      imageProvider = const AssetImage('assets/images/placeholder.png');
    }

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60,
      child: CircleAvatar(
        radius: 50,
        backgroundImage: imageProvider,
      ),
    );
  }
}
