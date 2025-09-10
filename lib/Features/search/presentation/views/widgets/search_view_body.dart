import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_cubit.dart';
import 'package:store_powered_ai/Features/home/presentation/manager/home_state.dart';
import 'package:store_powered_ai/Features/home/presentation/views/widgets/product_card_grid_view.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

// class _SearchViewBodyState extends State<SearchViewBody> {
//   bool isSearched = false;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: 16,
//         right: 15,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 24,
//             ),
//             SearchTextField(
//               onSubmitted: (value) {
//                 context.read<SearchCubit>().search(value);
//               },
//             ),
//             const SizedBox(
//               height: 18,
//             ),
//             isSearched
//                 ?  ProductCardGridView(
//                     products: [],
//                     isSearchWithImage: false,
//                   )
//                 : CustomReentlyAndTreadingPart(
//                     onTapSearch: () {
//                       setState(() {
//                         isSearched = true;
//                       });
//                     },
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            SearchTextField(
              onSubmitted: (value) {
                context.read<SearchCubit>().search(value);
              },
            ),
            const SizedBox(height: 18),
        
            /// BlocBuilder علشان تتابع حالة البحث
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchSuccess) {
                  return ProductCardGridView(
                    products: state.results,
                    isSearchWithImage: true,
            
                  );
                } else if (state is SearchError) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                  
                  //  CustomReentlyAndTreadingPart(
                  //   onTapSearch: () {},
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}


// class CustomReentlyAndTreadingPart extends StatelessWidget {
//   const CustomReentlyAndTreadingPart({super.key, required this.onTapSearch});
//   final void Function() onTapSearch;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomReentlySearched(
//           onTapSearch: onTapSearch,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Text(
//           'Treading Search',
//           style: Styles.textStyle16(context),
//         ),
//         SizedBox(
//           height: 9,
//         ),
//         ProductCardGridView(
//           products: [],
//           isSearchWithImage: false,
//         ),
//       ],
//     );
//   }
// }
