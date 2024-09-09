import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class NavigationSection extends StatelessWidget {
  const NavigationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8, // Elevation for shadow effect
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 212, 255, 214),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(
            color: primaryColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  CustomHomeNavigatorItem(
                      iconImage: "assets/images/user.png",
                      iconTitle: "Profile",
                      onTap: () {}),
                  CustomHomeNavigatorItem(
                      iconImage: "assets/images/play.png",
                      iconTitle: "Videos",
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  CustomHomeNavigatorItem(
                      iconImage: "assets/images/chat.png",
                      iconTitle: "Chat",
                      onTap: () {}),
                  CustomHomeNavigatorItem(
                      iconImage: "assets/images/notification-bell.png",
                      iconTitle: "Notification",
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  CustomHomeNavigatorItem(
                      iconImage: "assets/images/health-check.png",
                      iconTitle: "Reports",
                      onTap: () {}),
                  CustomHomeNavigatorItem(
                      iconImage: "assets/images/application.png",
                      iconTitle: "Articles",
                      onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomHomeNavigatorItem extends StatelessWidget {
  final String iconImage;
  final String iconTitle;
  final void Function() onTap;
  const CustomHomeNavigatorItem(
      {super.key,
      required this.iconImage,
      required this.iconTitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              iconImage,
              scale: 15,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              iconTitle,
              style: AppStyles.styleMedium14.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
