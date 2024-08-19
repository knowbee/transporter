import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:transporter/values/durations.dart';

class TAnimatedSwitcher extends StatelessWidget {
  const TAnimatedSwitcher({
    required this.child,
    super.key,
    this.alignment = Alignment.topCenter,
  });
  final Widget child;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) => AnimatedSizeAndFade(
        fadeDuration: AppDurations.normal,
        sizeDuration: AppDurations.normal,
        alignment: alignment,
        child: child,
      );
}
