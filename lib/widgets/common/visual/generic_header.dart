import 'package:flutter/material.dart';
import 'package:transporter/values/styles.dart';

class GenericHeader extends StatelessWidget {
  const GenericHeader({
    this.backLabel,
    this.hasTitle = false,
    this.title = 'Transporter',
    super.key,
  });

  final String? backLabel;
  final bool hasTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Color(0xFF414141),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      backLabel ?? '',
                      style: Styles.regularLightBlackSubheading,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            if (hasTitle)
              Align(
                child: Text(
                  title,
                  style: Styles.pageTitleTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
