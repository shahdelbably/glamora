import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_powered_ai/Features/authentication/data/repository/auth_repository.dart';
import 'package:store_powered_ai/Features/authentication/presentation/manager/auth_cubit.dart';
import 'package:store_powered_ai/Features/authentication/presentation/views/login_view.dart';
import 'package:store_powered_ai/Features/cart/data/reposity/cart_repo_imp.dart';
import 'package:store_powered_ai/Features/cart/presentation/manger/cart_cubit/cart_cubit.dart';
import 'package:store_powered_ai/Features/cart/presentation/views/cart_view.dart';
import 'package:store_powered_ai/Features/home/data/repo/home_repo__imp.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/profile/data/repos/orders_repo/orders_repo_impl.dart';
import 'package:store_powered_ai/Features/profile/data/repos/reviews_repo/reviews_repo_impl.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/orders_cubit/orders_cubit.dart';
import 'package:store_powered_ai/Features/profile/presentation/manger/reviews_cubit/reviews_cubit.dart';
import 'package:store_powered_ai/Features/search/data/repos/retrieve_repo_impl.dart';
import 'package:store_powered_ai/Features/search/presentation/manger/cubit/retrieve_cubit.dart';
import 'package:store_powered_ai/Features/splash/presentation/views/splash_view.dart';
import 'package:store_powered_ai/Features/virtualtry_on/data/repo/try_on_repo_imp.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/manager/cubit/try_on_cubit.dart';
import 'package:store_powered_ai/core/network/dio_helper.dart';
import 'package:store_powered_ai/core/utils/api_keys.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

//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
late List<CameraDescription> cameras;
String? token;
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  await CacheHelper.init();

  DioHelper.dio;

  token = CacheHelper.getData(key: 'token');
  Stripe.publishableKey = ApiKeys.publishableKey;

  runApp(const ProviderScope(child: GraduationProject()));
}

class GraduationProject extends StatelessWidget {
  const GraduationProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(AuthRepository())..getMe(),
        ),
        BlocProvider(
          create: (context) => NewArrivalsCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) => CartCubit(CartRepoImp()),
        ),
        BlocProvider(
          create: (context) {
            final cubit = FavouriteCubit(HomeRepoImpl()); // ✅ كده صح
            if (token != null) {
              cubit.getFavorites();
            }
            return cubit;
          },
        ),
        BlocProvider(
          create: (context) => ReviewsCubit(reviewRepo: ReviewRepoImpl()),
        ),
        BlocProvider(
          create: (context) => OrdersCubit(OrdersRepoImpl()),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit(HomeRepoImpl()),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
              HomeRepoImpl()), // أو بأي طريقة بتستخدميها لحقن الريبو
        ),
        BlocProvider(
          create: (context) => RetrieveCubit(RetrieveRepoImpl()),
        ),
        BlocProvider(
          create: (context) => TryOnCubit(TryOnRepository(Dio())),
        ),
      ],
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, currentMode, _) {
          return MaterialApp(
            routes: {
              '/login': (context) => const LoginView(
                    isOnboarding: false,
                    returnScreen: CartView(),
                  ),
            },
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.white, // الخلفية الرئيسية
              canvasColor: Colors.white, // ✅ للـ bottom sheet و drawers
              cardColor: Colors.white, // ✅ لأي Card/Container بياخد من الثيم
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.white, // ✅ للـ bottom sheets
              ),
              textTheme: ThemeData.light().textTheme.apply(
                    bodyColor: Colors.black,
                    displayColor: Colors.black,
                  ),
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              progressIndicatorTheme: const ProgressIndicatorThemeData(
                color: Colors.white,
              ),
            ),
            themeMode: currentMode,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
