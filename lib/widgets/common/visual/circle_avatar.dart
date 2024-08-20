import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    required this.imagePath,
    super.key,
    this.radius = 50.0,
    this.backgroundColor = Colors.white,
    this.imageWidth = 64.0,
    this.imageHeight = 64.0,
    this.fit = BoxFit.cover,
    this.borderColor = Colors.grey,
    this.borderWidth = 2.0,
  });
  final double radius;
  final Color backgroundColor;
  final String imagePath;
  final double imageWidth;
  final double imageHeight;
  final BoxFit fit;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: CircleAvatar(
        radius: radius - borderWidth,
        backgroundColor: backgroundColor,
        child: ClipOval(
          child: Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
            fit: fit,
          ),
        ),
      ),
    );
  }
}
