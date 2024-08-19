import 'package:flutter/material.dart';
import 'package:transporter/values/styles.dart';

class GenericHeader extends StatelessWidget {
  const GenericHeader({
    this.titleText,
    super.key,
  });
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Color(0xFF414141),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    titleText ?? '',
                    style: Styles.regularLightBlackSubheading,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
