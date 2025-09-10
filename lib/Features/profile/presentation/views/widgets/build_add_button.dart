import 'package:flutter/material.dart';

Widget buildAddButton(String text, {required void Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Icon(Icons.add, size: 16),
      ),
      label: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          padding: const EdgeInsets.symmetric(vertical: 4),
          side: const BorderSide(width: 1.5)),
    ),
  );
}
