import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/banner.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_search_container.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/custom_styles_container.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/dots_indicator.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_category_card_list_view.dart';
import 'package:store_powered_ai/core/utils/styles.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  HomeViewBodyState createState() => HomeViewBodyState();
}

class HomeViewBodyState extends State<HomeViewBody> {
  late final PageController pageController;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    _autoScrollTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageController.hasClients) {
        int nextPage = pageController.page?.round() ?? 0;
        nextPage = (nextPage + 1) % 5;

        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<NewArrivalsCubit>().state is! HomeNewArrivalsLoaded) {
        context.read<NewArrivalsCubit>().getNewArrivals();
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(child: CustomHomeAppBar()),
            Text(
              'Glad to see you! Let’s make fashion effortless.',
              style: Styles.textStyle13(context).copyWith(
                fontWeight: FontWeight.w300,
                color: const Color(0xff92929D),
              ),
            ),
            const SizedBox(height: 16),
            const CustomSearchContainer(),
            const SizedBox(height: 16),
            BannerItems(pageController: pageController),
            const SizedBox(height: 15),
            Center(
              child: DotsIndicator(
                pageController: pageController,
                count: 5,
              ),
            ),
            const SizedBox(height: 24),
            const ProductCatogaryCardListView(title: 'Recommended for you'),
            const ProductCatogaryCardListView(title: 'New Arrivals'),
            const CustomStylesContainer(),
            const SizedBox(height: 24),
            const ProductCatogaryCardListView(title: 'Top Trends'),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
