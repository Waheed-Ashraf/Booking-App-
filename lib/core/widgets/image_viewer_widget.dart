import 'dart:io';

import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final File image;

  const ImageViewer({super.key, required this.image});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Center(child: Image.file(widget.image)),
      ),
    );
  }
}
