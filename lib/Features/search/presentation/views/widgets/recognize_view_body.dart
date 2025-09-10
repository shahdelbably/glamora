// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'dart:io';
import 'dart:ui'; // For blur effect
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_powered_ai/Features/search/presentation/manger/cubit/retrieve_cubit.dart';
import 'package:store_powered_ai/Features/search/presentation/views/widgets/custom_bottom_search_sheet.dart';
import 'package:store_powered_ai/core/utils/cache_helper.dart';

class RecognizeViewBody extends StatefulWidget {
  final File imageFile;

  const RecognizeViewBody({super.key, required this.imageFile});

  @override
  RecognizeViewBodyState createState() => RecognizeViewBodyState();
}

class RecognizeViewBodyState extends State<RecognizeViewBody> {
  bool showScanner = false;
  bool showBlur = false;
  double x = 0;
  double y = 0;
  final double focusSize = 150;
  final token = CacheHelper.getData(key: 'token');

  @override
  void initState() {
    BlocProvider.of<RetrieveCubit>(context)
        .postRetrieve(image: widget.imageFile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RetrieveCubit, RetrieveState>(
        builder: (context, state) {
          if (token == null) {
            Future.microtask(() {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please login !')),
              );
              Navigator.pushReplacementNamed(context, '/login');
            });
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (state is RetrieveLoading) {
              return GestureDetector(
                onTapUp: (details) {
                  // _onTap(details);
                },
                child: Stack(
                  children: [
                    // Background image (unblurred initially)
                    Positioned.fill(
                      child: Image.file(
                        widget.imageFile,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),

                    // Apply blur effect after tap
                    if (showBlur)
                      Positioned.fill(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                              color: Colors.white.withOpacity(
                                  0.1)), // خففنا البلور وجعلناه أبيض
                        ),
                      ),

                    // Scanner effect
                    if (showScanner)
                      Positioned.fill(
                        child: CustomPaint(
                          painter: ScannerPainter(x, y, focusSize),
                        ),
                      ),

                    // Cropped clear area
                    if (showScanner)
                      Positioned(
                        top: y - focusSize / 2,
                        left: x - focusSize / 2,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 3,
                                sigmaY: 3), // Slight blur around scanner
                            child: SizedBox(
                              width: focusSize,
                              height: focusSize,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: -x + focusSize / 2,
                                    top: -y + focusSize / 2,
                                    child: Image.file(
                                      widget.imageFile,
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    // Progress bar and close button
                    Positioned(
                      bottom: 100,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Column(
                          children: [
                            const LinearProgressIndicator(
                              backgroundColor: Colors.white,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              'Recognizing',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Container(
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.black),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Back button (top-left)
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is RetrieveSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return CustomBottomSearchSheet(
                      productModel: state.products,
                      issearchWithImage: true,
                    );
                  },
                );
              });
              return Container(); // أو أي Widget
            } else if (state is RetrieveFailure) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Center(child: Text(state.error));
                  },
                );
              });
              return Container(); // أو أي Widget
            } else {
              return const SizedBox();
            }
          }
        },
      ),
    );
  }

//  void _onTap(TapUpDetails details) {
//     setState(() {
//       showScanner = true;
//       showBlur = true;
//       x = details.localPosition.dx;
//       y = details.localPosition.dy;
//     });

//     Future.delayed(const Duration(milliseconds: 200), () {
//       if (mounted) {
//         showModalBottomSheet(
//             isScrollControlled: true,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(30),
//                 topRight: Radius.circular(30),
//               ),
//             ),
//             context: context,
//             builder: (context) {
//               // return CustomBottomSearchSheet();
//             });
//       }
//     });
//   }
}

// Custom painter for scanner effect
class ScannerPainter extends CustomPainter {
  final double x;
  final double y;
  final double size;
  ScannerPainter(this.x, this.y, this.size);

  @override
  void paint(Canvas canvas, Size screenSize) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8 // Increased thickness for scanner
      ..style = PaintingStyle.stroke;

    final double left = x - size / 2;
    final double top = y - size / 2;
    final double right = x + size / 2;
    final double bottom = y + size / 2;
    const double cornerLength = 30; // Bigger corners

    final Path path = Path()
      ..moveTo(left, top + cornerLength) // Top-left
      ..lineTo(left, top)
      ..lineTo(left + cornerLength, top)
      ..moveTo(right - cornerLength, top) // Top-right
      ..lineTo(right, top)
      ..lineTo(right, top + cornerLength)
      ..moveTo(right, bottom - cornerLength) // Bottom-right
      ..lineTo(right, bottom)
      ..lineTo(right - cornerLength, bottom)
      ..moveTo(left + cornerLength, bottom) // Bottom-left
      ..lineTo(left, bottom)
      ..lineTo(left, bottom - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ScannerPainter oldDelegate) {
    return oldDelegate.x != x || oldDelegate.y != y || oldDelegate.size != size;
  }
}
