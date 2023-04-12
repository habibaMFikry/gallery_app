import 'package:flutter/material.dart';

class GridViewItem extends StatelessWidget {
  final dynamic image;
  const GridViewItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(image, fit: BoxFit.cover),
    );
  }
}
