import 'package:flutter/material.dart';
import 'package:transporter/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.of(context).transporterAppBarTitle),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hi',
            ),
          ],
        ),
      ),
    );
  }
}
