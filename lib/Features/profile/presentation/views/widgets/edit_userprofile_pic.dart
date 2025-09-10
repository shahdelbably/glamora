import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditUserprofilePic extends StatefulWidget {
  final String? avatarPathFromApi; // مسار الصورة الجاي من الـ API

  const EditUserprofilePic({super.key, required this.avatarPathFromApi});

  static File? imageFile;

  @override
  EditUserprofilePicState createState() => EditUserprofilePicState();
}

class EditUserprofilePicState extends State<EditUserprofilePic> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        EditUserprofilePic.imageFile = File(pickedFile.path);
      });
    }
  }

  ImageProvider getImageProvider() {
    if (EditUserprofilePic.imageFile != null &&
        !EditUserprofilePic.imageFile!.path.contains('avatarFile.jpg')) {
      return FileImage(EditUserprofilePic.imageFile!);
    } else if (widget.avatarPathFromApi != null &&
        widget.avatarPathFromApi!.isNotEmpty) {
      final cleanedPath =
          widget.avatarPathFromApi!.split(": ").last.replaceAll("'", "").trim();

      if (!cleanedPath.contains('avatarFile.jpg')) {
        return FileImage(File(cleanedPath));
      }
    }

    return const AssetImage('assets/images/placeholder.png');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.transparent,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            backgroundImage: getImageProvider(),
          ),
        ),
        Positioned(
          bottom: 7,
          child: GestureDetector(
            onTap: _pickImage,
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              child: Icon(Icons.edit, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }
}
