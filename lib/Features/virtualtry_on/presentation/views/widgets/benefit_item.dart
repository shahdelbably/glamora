import 'package:flutter/material.dart';

class BenefitItem extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const BenefitItem({
    super.key,
    required this.number,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isDark
              ? (isSelected
                  ? const Color(0xff2A2A2A)
                  // ignore: deprecated_member_use
                  : const Color(0xFF2A2A2A).withOpacity(0.28))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          image: isSelected
              ? const DecorationImage(
                  image: AssetImage('assets/images/ai-background.jpeg'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: Text(
                number,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Colors.black
                        : (isDark ? Colors.white : Colors.black)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? Colors.black
                            : (isDark ? Colors.white : Colors.black)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.black
                          : (isDark
                              ? const Color(0Xff787878)
                              // ignore: deprecated_member_use
                              : Colors.black.withOpacity(0.800000011920929)),
                      // color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
