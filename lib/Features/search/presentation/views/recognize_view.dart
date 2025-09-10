import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/recognize_view_body.dart';

class RecognizeView extends StatelessWidget {
  const RecognizeView({super.key, required this.imageFile});
  final File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecognizeViewBody(imageFile: imageFile),
    );
  }
}
