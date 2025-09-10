import 'package:flutter/material.dart';

class CustomRelatedProductImage extends StatefulWidget {
  const CustomRelatedProductImage({super.key, required this.isActive});
  final bool isActive;

  @override
  State<CustomRelatedProductImage> createState() =>
      _CustomRelatedProductImageState();
}

class _CustomRelatedProductImageState extends State<CustomRelatedProductImage> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
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
        child: Padding(
          padding: const EdgeInsets.only(
            right: 6,
            top: 15,
          ),
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
      ),
    );
  }
}
