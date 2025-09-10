import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/cart_view.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/fav_icon.dart';

class CustomProductDetailsImage extends StatefulWidget {
  const CustomProductDetailsImage({
    super.key,
    required this.isActive,
    required this.product,
  });
  final bool isActive;
  final ProductModel product;

  @override
  State<CustomProductDetailsImage> createState() =>
      _CustomProductDetailsImageState();
}

class _CustomProductDetailsImageState extends State<CustomProductDetailsImage> {
  late bool isActive;
  @override
  void initState() {
    super.initState();
    isActive = widget.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 420,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        image: DecorationImage(
          image: NetworkImage(widget.product.img),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          left: 16,
          right: 15,
          bottom: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CartView(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    }));
                  },
                  icon: const Icon(
                    FontAwesomeIcons.cartShopping,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerRight,
                child: FavoriteIcon(product: widget.product)),
          ],
        ),
      ),
    );
  }
}
