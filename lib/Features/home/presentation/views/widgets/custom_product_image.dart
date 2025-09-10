import 'package:flutter/material.dart';

class CustomProductImage extends StatefulWidget {
  const CustomProductImage(
      {super.key,
      required this.isActive,
      required this.width,
      required this.height, required String imageUrl});
  final bool isActive;
  final double width;
  final double height;

  @override
  State<CustomProductImage> createState() => _CustomProductImageState();
}

class _CustomProductImageState extends State<CustomProductImage> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/image 23.png',
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            setState(() {
              _isActive = !_isActive;
            });
          },
          icon: Icon(
            _isActive ? Icons.favorite : Icons.favorite_border_outlined,
            color: _isActive ? Colors.red : Colors.black,
          ),
        ),
      ),
    );
  }
}
