import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class OfferImagesSlider extends StatelessWidget {
  const OfferImagesSlider({
    super.key,
    this.onPageChanged,
  });
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: CarouselSlider(
        options: CarouselOptions(
          onPageChanged: onPageChanged,
          autoPlay: true,
          enableInfiniteScroll: false,
          aspectRatio: 6 / 2,
          enlargeCenterPage: true,
        ),
        items: List.generate(
          3,
          (index) => Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(8)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/Black_friday.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
