import 'package:flutter/material.dart';

void showSnackBar(context, {required Color color, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      content: Center(
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyMedium! // Uses custom global text style
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: color,
    ),
  );
}
