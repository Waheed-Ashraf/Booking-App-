import 'package:booking_depi_proj/features/home/presentation/views/widgets/dots_indicator_list.dart';
import 'package:booking_depi_proj/features/home/presentation/views/widgets/offer_images_slider.dart';
import 'package:flutter/material.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OfferImagesSlider(
          onPageChanged: (index, p1) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        const SizedBox(
          height: 14,
        ),
        DotsIndicator(
          currentPageIndex: currentPageIndex,
        ),
      ],
    );
  }
}
