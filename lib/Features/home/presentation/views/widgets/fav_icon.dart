// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
// import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
// import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
// import 'package:store_powered_ai/core/utils/cache_helper.dart';

// class FavoriteIcon extends StatelessWidget {
//   const FavoriteIcon({
//     super.key,
//     required this.product,
//   });

//   final ProductModel product;

//   @override
// Widget build(BuildContext context) {
//   return Builder(
//     builder: (context) {
//       final isFavorite = context.watch<FavouriteCubit>().isProductFavorite(product.id);

//       return IconButton(
//         icon: Icon(
//           isFavorite ? Icons.favorite : Icons.favorite_border,
//           color: isFavorite ? Colors.red : Colors.grey,
//         ),
//         onPressed: () {
//           final token = CacheHelper.getData(key: 'token');

//           if (token == null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(
//                 content: Text('يرجى تسجيل الدخول أولاً'),
//                 behavior: SnackBarBehavior.floating,
//                 backgroundColor: Colors.orange,
//               ),
//             );
//             Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginView()));
//             return;
//           }

//           final favouriteCubit = context.read<FavouriteCubit>();
//           if (isFavorite) {
//             favouriteCubit.removeFromFavorites(product.id);
//           } else {
//             favouriteCubit.addToFavorites(product.id, product.name, product.img);
//           }
//         },
//       );
//     },
//   );
// }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.product, this.returnScreen,
  });

  final ProductModel product;
 final Widget? returnScreen;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, HomeState>(
      builder: (context, state) {
        final isFavorite = context.watch<FavouriteCubit>().isProductFavorite(product.id);

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            final token = CacheHelper.getData(key: 'token');

            if (token == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('يرجى تسجيل الدخول أولاً'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.orange,
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginView(isOnboarding: false,returnScreen:returnScreen ,)),
              );
              return;
            }

            final favouriteCubit = context.read<FavouriteCubit>();

            if (isFavorite) {
              favouriteCubit.removeFromFavorites(product.id);
            } else {
              favouriteCubit.addToFavorites(product.id, product.name, product.img);
            }
          },
        );
      },
    );
  }
}
