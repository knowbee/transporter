import 'package:flutter/material.dart';
import 'package:transporter/app/app.dart';
import 'package:transporter/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap(() => const App());
}
