import 'package:flutter/material.dart';
import 'package:store_powered_ai/Features/home/data/models/product_models.dart';
import 'package:store_powered_ai/Features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/add_items.dart';
import 'package:store_powered_ai/Features/virtualtry_on/presentation/views/widgets/benefit_item.dart';

class TryOn extends StatefulWidget {
  const TryOn(
      {super.key,
      required this.itemImage,
      required this.clothingType,
      required this.relatedProducts});
  final String itemImage;
  final String clothingType;
  final List<RelatedProductModel> relatedProducts;

  @override
  TryOnState createState() => TryOnState();
}

class TryOnState extends State<TryOn> {
  int selectedBenefitIndex = 0;
  final ImagePicker _picker = ImagePicker();

  XFile? imageFile;

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = pickedFile; // Store the selected image
      });

      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => AddItemsInTryOn(
            imagePath: pickedFile.path,
            itemImage: widget.itemImage,
            clothingType: widget.clothingType,
            relatedProducts: widget.relatedProducts,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileCustomAppBar(title: 'Try The Product'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/ai-background.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                          image: AssetImage(
                              'assets/images/mdi_star-four-points.png')),
                      const SizedBox(height: 12),
                      const Text(
                        'Click or drag images here to upload',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 2.50,
                        ),
                      ),
                      const SizedBox(height: 22),
                      GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 48,
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                          ),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/bytesize_upload.png'),
                                width: 24,
                                height: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Upload',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'JPG , JPEG , PNG , BMP , WEBP',
                        style: TextStyle(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.800000011920929),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300,
                          height: 3.33,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Why You’ll Love AI in shopping',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: BenefitItem(
                            number: (index + 1).toString().padLeft(2, '0'),
                            title: index == 0
                                ? 'Perfect Fit Every Time'
                                : index == 1
                                    ? 'Save Time and Effort'
                                    : 'Boost Your Confidence',
                            description: index == 0
                                ? 'No more guessing sizes or worrying about returns. Our AI ensures you pick the right size based on your body shape.'
                                : index == 1
                                    ? 'Forget about fitting rooms or the hassle of returning items. Everything you need is just a few clicks away.'
                                    : 'AI helps you find styles that fit your personality and body type, so you feel great about what you’re buying.',
                            isSelected: selectedBenefitIndex == index,
                            onTap: () {
                              setState(() {
                                selectedBenefitIndex = index;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
