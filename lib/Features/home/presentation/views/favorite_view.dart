import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/favorite_view_body.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';
import 'package:store_powered_ai/core/widgets/custom_app_bar.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();

    final token = CacheHelper.getData(key: 'token');
    if (token == null) {
      // المستخدم مش مسجل دخول
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('يرجى تسجيل الدخول للوصول إلى المفضلة'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.orange,
          ),
        );
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const LoginView(
                      isOnboarding: false,
                      returnScreen: FavoriteView(),
                    )));
      });
    } else {
      // استدعاء المفضلة فقط لو فيه توكن
      context.read<FavouriteCubit>().getFavorites();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, HomeState>(
      builder: (context, state) {
        final favoriteItems = context.read<FavouriteCubit>().favoriteProducts;

        if (state is HomeFavoriteError) {
          return Scaffold(
            appBar: AppBar(
              title: const CustomAppBar(pageName: 'Favorite'),
              centerTitle: true,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  size: 26,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ),
            body: Center(child: Text(state.errorMessage)),
          );
        }

        if (favoriteItems.isEmpty) {
          Future.microtask(() {
            // ignore: use_build_context_synchronously
            if (Navigator.canPop(context)) {
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            }
          });

          // return Scaffold(
          //   appBar: AppBar(
          //     title: const CustomAppBar(pageName: 'Favorite'),
          //     centerTitle: true,
          //   ),
          //   body: EmptyProduct(
          //     text: 'Any favorite product will appear here',
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          // );
        }

        return Scaffold(
          body: FavoriteViewBody(
            favoriteItems: favoriteItems.toList(),
          ),
        );
      },
    );
  }
}
