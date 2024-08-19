// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';

class TProgressHeader extends StatelessWidget {
  const TProgressHeader({
    super.key,
    this.width = 120,
    this.showSkip = true,
    this.onTap,
  });
  final double width;
  final bool showSkip;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (showSkip)
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextButton(
                  onPressed: () => onTap?.call(),
                  child: Text(
                    Strings.of(context).onboarding_skip,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            )
          else
            Container(
              margin: const EdgeInsets.only(top: 100),
            ),
        ],
      ),
    );
  }
}
